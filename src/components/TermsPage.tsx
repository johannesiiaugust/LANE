import { Footer } from '@/components/Footer'

function navigate(path: string) {
  window.history.pushState(null, '', path)
  window.dispatchEvent(new PopStateEvent('popstate'))
}

export function TermsPage() {
  return (
    <div className="flex flex-col min-h-screen bg-background">
      <div className="border-b bg-background px-6 py-3 flex items-center justify-between">
        <button onClick={() => navigate('/')} className="text-xl font-bold hover:opacity-80 transition-opacity">
          LifeLANE
        </button>
        <button onClick={() => navigate('/about')} className="text-sm text-muted-foreground hover:underline">
          ← Back
        </button>
      </div>

      <div className="flex-1 max-w-3xl mx-auto w-full px-6 py-10 space-y-8">
        <div>
          <h1 className="text-3xl font-bold mb-1">Terms & Conditions</h1>
          <p className="text-xs text-muted-foreground italic">Draft — last updated March 2026</p>
        </div>

        <div className="space-y-6 text-sm text-muted-foreground leading-relaxed">
          {[
            ['1. Acceptance of Terms', 'By accessing or using LifeLANE ("the Service"), you agree to be bound by these Terms & Conditions. If you do not agree, please do not use the Service.'],
            ['2. Use of the Service', 'LifeLANE is provided for personal, non-commercial use. You are responsible for all content you create and store. You may not use the Service for any unlawful purpose or in a way that could harm other users.'],
            ['3. Data & Privacy', 'Your data is stored securely using Supabase (PostgreSQL with Row-Level Security). Only you can see your private timelines. Public timelines are visible to anyone with the link. We may use anonymised aggregate data to improve the Service.'],
            ['4. Account Responsibility', 'You are responsible for maintaining the security of your account credentials. Notify us immediately if you suspect unauthorised access. We are not liable for losses resulting from unauthorised use of your account.'],
            ['5. Intellectual Property', 'All intellectual property rights in and to the LifeLANE application — including its code, design, branding, and all content provided by LifeLANE — are and remain the exclusive property of LifeLANE.'],
            ['6. Disclaimer of Warranties', 'The Service is provided "as is" without warranties of any kind. We do not guarantee uptime, data durability, or fitness for a particular purpose. Financial projections shown in the app are illustrative only and not financial advice.'],
            ['7. Limitation of Liability', 'To the fullest extent permitted by law, LifeLANE and its operators shall not be liable for any indirect, incidental, or consequential damages arising from your use of the Service.'],
            ['8. Changes to Terms', 'We may update these terms from time to time. Continued use of the Service after changes constitutes acceptance of the revised terms.'],
            ['9. Governing Law', 'These terms are governed by the laws of Switzerland. Any disputes shall be subject to the exclusive jurisdiction of the courts of Zurich, Switzerland.'],
          ].map(([title, body]) => (
            <div key={title}>
              <h3 className="font-semibold text-foreground mb-1">{title}</h3>
              <p>{body}</p>
            </div>
          ))}

          <div>
            <h3 className="font-semibold text-foreground mb-1">10. Historical Personas</h3>
            <p>
              The historical personas available in LifeLANE are provided for illustrative and inspirational purposes only. While we aim for reasonable accuracy, the information may contain errors or omissions. LifeLANE makes no warranty as to the completeness or accuracy of any persona data. If you are the subject of a persona, a representative, or otherwise have a legitimate concern, you may request its removal by contacting us at{' '}
              <a href="mailto:hello@timelane.space" className="underline text-foreground hover:opacity-70">hello@timelane.space</a> and we will action the request promptly.
            </p>
          </div>
        </div>

        <div className="pt-4 border-t">
          <p className="text-sm text-muted-foreground">
            Questions? <a href="mailto:hello@timelane.space" className="underline text-foreground hover:opacity-70">hello@timelane.space</a>
          </p>
        </div>
      </div>

      <Footer />
    </div>
  )
}
