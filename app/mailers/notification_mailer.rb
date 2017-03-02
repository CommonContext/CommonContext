class NotificationMailer < ApplicationMailer
  default from: 'commoncontextinfo@gmail.com'

  def welcome_email()
    to_email = "dharinishree@gmail.com"
    mail(to: to_email, subject: 'This is the welcome Email')
  end
end
