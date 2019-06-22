class EndUserMailer < ApplicationMailer

  # Subject can be set in your I18n file at config/locales/en.yml
  # with the following lookup:
  #
  #   en.end_user_mailer.send_mail.subject
  #

  default from: 'notifications@example.com'

  def 
    @end_user = params[:end_user]
    @url  = 'http://example.com/login'
    mail(to: @end_user.email, subject: 'お問い合わせありがとうございます。')
  end
end
