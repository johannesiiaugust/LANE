const C = {
  yale: '#124e78',
  gold: '#f2bb05',
  garnet: '#6e0e0a',
} as const

export function Logo({ size = 'md' }: { size?: 'sm' | 'md' | 'lg' }) {
  const text = size === 'lg' ? 'text-2xl' : size === 'md' ? 'text-lg' : 'text-base'
  const flagH = size === 'lg' ? 16 : size === 'md' ? 13 : 10
  const flagW = size === 'lg' ? 22 : size === 'md' ? 17 : 13
  const gap = size === 'lg' ? 5 : size === 'md' ? 4 : 3

  return (
    <span className="inline-flex items-center" style={{ gap }}>
      <span className={`${text} font-bold tracking-tight leading-none`} style={{ color: C.yale }}>
        Time<span style={{ letterSpacing: '0.04em' }}>LANE</span>
      </span>
      <span className="inline-flex flex-col shrink-0" style={{ width: flagW, height: flagH }}>
        <span className="flex-1" style={{ backgroundColor: C.yale }} />
        <span className="flex-1" style={{ backgroundColor: C.gold }} />
        <span className="flex-1" style={{ backgroundColor: C.garnet }} />
      </span>
    </span>
  )
}
