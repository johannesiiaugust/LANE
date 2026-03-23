import type { ValueProjection, ValueGrowthPeriod, ValueDeposit } from '@/types/timeline'

const DT = 1 / 12 // monthly steps for accuracy

// Deposits at this frequency or lower (per year) are treated as discrete lump-sum
// events so they show as instant jumps in the graph rather than smooth slopes.
// Weekly (52/yr) and daily (365/yr) remain continuous approximations.
const MAX_DISCRETE_PPY = 12

function depositPPY(dep: ValueDeposit): number {
  switch (dep.frequency) {
    case 'daily':    return 365
    case 'weekly':   return 52
    case 'monthly':  return 12
    case 'quarterly': return 4
    case 'yearly':   return 1
    case 'custom': {
      const interval = dep.customInterval ?? 1
      const unitPPY = dep.customUnit === 'day' ? 365
        : dep.customUnit === 'week' ? 52
        : dep.customUnit === 'month' ? 12
        : dep.customUnit === 'quarter' ? 4
        : 1
      return unitPPY / Math.max(1, interval)
    }
    default: return 12
  }
}

function growthAt(
  year: number,
  periods: ValueGrowthPeriod[],
): { rate: number; applyOnNegative: boolean } | null {
  for (const p of periods) {
    if (year >= p.startYear - 1e-9 && year <= p.endYear + 1e-9) {
      return { rate: p.growthPercent, applyOnNegative: p.applyOnNegative }
    }
  }
  return null
}

/**
 * Returns all occurrence years for a discrete deposit within [fromYear, toYear].
 * Occurrences are at dep.startYear + n * (1/ppy) for n = 0, 1, 2, …
 */
function depositOccurrences(dep: ValueDeposit, fromYear: number, toYear: number): number[] {
  const ppy = depositPPY(dep)
  if (ppy > MAX_DISCRETE_PPY) return []
  const interval = 1 / ppy
  const dEnd = dep.endYear ?? toYear
  const result: number[] = []
  // Find the first n such that dep.startYear + n*interval >= fromYear - 1e-9
  const firstN = Math.max(0, Math.ceil((fromYear - dep.startYear - 1e-9) / interval))
  for (let n = firstN; ; n++) {
    const occ = dep.startYear + n * interval
    if (occ > Math.min(dEnd, toYear) + 1e-9) break
    if (occ >= fromYear - 1e-9) result.push(occ)
  }
  return result
}

/**
 * Returns all discrete deposit occurrence years across all deposits in a
 * projection within [fromYear, toYear]. Used to insert graph anchor points.
 */
export function getDiscreteDepositYears(
  projection: ValueProjection,
  fromYear: number,
  toYear: number,
): number[] {
  const result: number[] = []
  for (const dep of projection.deposits ?? []) {
    result.push(...depositOccurrences(dep, fromYear, toYear))
  }
  return result
}

/** Compute value at a given fractional year by stepping monthly from startYear. */
export function computeValueAtYear(
  targetYear: number,
  startYear: number,
  projection: ValueProjection,
): number {
  if (targetYear <= startYear) return projection.startValue

  // Merge spot changes and discrete deposit occurrences into one sorted event list.
  // Each entry represents an instant addition to the running value at a specific year.
  const discrete: { year: number; amount: number }[] = []

  for (const sc of projection.spotChanges ?? []) {
    discrete.push({ year: sc.year, amount: sc.amount })
  }

  for (const dep of projection.deposits ?? []) {
    const ppy = depositPPY(dep)
    if (ppy <= MAX_DISCRETE_PPY) {
      for (const occ of depositOccurrences(dep, startYear, targetYear)) {
        const yearsElapsed = occ - dep.startYear
        const growthFactor = dep.annualGrowthPercent
          ? Math.pow(1 + dep.annualGrowthPercent / 100, yearsElapsed)
          : 1
        discrete.push({ year: occ, amount: dep.amount * growthFactor })
      }
    }
  }

  discrete.sort((a, b) => a.year - b.year)

  // High-frequency (weekly/daily) deposits that stay as continuous approximations
  const continuousDeposits = (projection.deposits ?? []).filter(d => depositPPY(d) > MAX_DISCRETE_PPY)

  let dIdx = 0
  let value = projection.startValue
  let t = startYear

  while (t < targetYear - 1e-9) {
    const step = Math.min(DT, targetYear - t)
    const tEnd = t + step

    // Discrete events (spot changes + low-freq deposits) in [t, tEnd)
    while (dIdx < discrete.length && discrete[dIdx].year < tEnd) {
      if (discrete[dIdx].year >= t) value += discrete[dIdx].amount
      dIdx++
    }

    // Continuous deposits (weekly/daily) overlapping [t, tEnd)
    for (const dep of continuousDeposits) {
      const dEnd = dep.endYear ?? targetYear
      if (dep.startYear >= tEnd || dEnd <= t) continue
      const overlap = Math.min(tEnd, dEnd) - Math.max(t, dep.startYear)
      const ppy = depositPPY(dep)
      const midT = Math.max(t, dep.startYear) + overlap * 0.5
      const yearsElapsed = midT - dep.startYear
      const growthFactor = dep.annualGrowthPercent
        ? Math.pow(1 + dep.annualGrowthPercent / 100, yearsElapsed)
        : 1
      value += dep.amount * growthFactor * ppy * overlap
    }

    // Compound growth for this step
    const g = growthAt(t + step * 0.5, projection.growthPeriods ?? [])
    if (g && g.rate !== 0 && (value >= 0 || g.applyOnNegative)) {
      value *= Math.pow(1 + g.rate / 100, step)
    }

    t = tEnd
  }

  // Discrete events exactly at targetYear
  while (dIdx < discrete.length && discrete[dIdx].year <= targetYear) {
    value += discrete[dIdx].amount
    dIdx++
  }

  return value
}

/** Generate a dense series suitable for drawing a sparkline. Points after currentYear are marked projected. */
export function generateSparklineSeries(
  startYear: number,
  endYear: number,
  projection: ValueProjection,
  currentYear: number,
  numSamples = 80,
): { year: number; value: number; projected: boolean }[] {
  if (endYear <= startYear) return []

  const yearSet = new Set<number>()
  for (let i = 0; i <= numSamples; i++) {
    yearSet.add(startYear + (i / numSamples) * (endYear - startYear))
  }

  // Sharp-step anchors for spot changes and discrete deposit occurrences
  const jumpYears: number[] = [
    ...(projection.spotChanges ?? []).map(sc => sc.year),
    ...getDiscreteDepositYears(projection, startYear, endYear),
  ]
  for (const sy of jumpYears) {
    if (sy > startYear && sy <= endYear) {
      yearSet.add(sy - 1e-6)
      yearSet.add(sy + 1e-9)
    }
  }

  return Array.from(yearSet)
    .sort((a, b) => a - b)
    .map(year => ({
      year,
      value: computeValueAtYear(year, startYear, projection),
      projected: year > currentYear,
    }))
}

export function formatValue(v: number): string {
  return new Intl.NumberFormat(undefined, { maximumFractionDigits: 0 }).format(v)
}
