class InquiryMailer < ApplicationMailer

#end_user側の送信時設定
  def received_email(inquiry)
  	@inquiry = inquiry
    mail(to: 'admin@email', subject: 'レポート')
  end
#admin側の送信時設定
  def reply_email(inquiry)
  	@inquiry = inquiry
    mail(to: @inquiry.email, subject: 'レポート')
  end
end
