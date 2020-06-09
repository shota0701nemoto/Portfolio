# frozen_string_literal: true

class ContactMailer < ApplicationMailer
  def contact_mail(contact)
    @contact = contact
    mail(
      from: 'system@example.com',  # 送信元
      to: ENV['MAIL'],             # 送信先
      subject: '問い合わせ'
    )
  end
end
