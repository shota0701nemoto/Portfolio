class ContactMailer < ApplicationMailer

  def contact_mail(contact)
    @contact = contact
    mail(
       from: 'system@example.com',
       to: ENV['MAIL'],
       subject: "問い合わせ"
     )
  end
end
