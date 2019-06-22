# Preview all emails at http://localhost:3000/rails/mailers/end_user_mailer
class EndUserMailerPreview < ActionMailer::Preview

  # Preview this email at http://localhost:3000/rails/mailers/end_user_mailer/send_mail
  def send_mail
    EndUserMailer.send_mail
  end

end
