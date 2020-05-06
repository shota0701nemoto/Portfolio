class ContactMailer < ApplicationMailer

  def contact_mail(contact)
    @contact = contact
    mail to: ENV['MAIL'], subject: "問い合わせ"
  end
end
