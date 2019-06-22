class InquiryMailer < ApplicationMailer

  def received_email(inquiry)
  	@inquiry = inquiry
    mail(to: @inquiry.email, subject: 'レポート')
  end
  def reply_email(inquiry)
  	@inquiry = inquiry
    mail(to: @inquiry.email, subject: 'レポート')
  end
end
