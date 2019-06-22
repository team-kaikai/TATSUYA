class EndUserMailer < ApplicationMailer

  # Subject can be set in your I18n file at config/locales/en.yml
  # with the following lookup:
  #
  #   en.end_user_mailer.send_mail.subject
  #

  def send_mail(enduser)
    @enduser = enduser
    mail to: enduser.email, subject:"Sample from Rails"
  end
end
