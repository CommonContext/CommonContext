class NotificationMailer < ApplicationMailer
  default from: 'commoncontextinfo@gmail.com'

  def welcome_email(email)
    to_email = email 
    mail(to: to_email, subject: 'This is the welcome Email')
  end
end
