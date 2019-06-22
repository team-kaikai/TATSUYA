class InquiryMailer < ApplicationMailer

  default from: 'notifications@example.com'

  def report(inquiry)
    @inquiry = inquiry
    @url  = 'http://example.com/login'
    mail(to: @user.email, subject: 'レポート')
  end
end
