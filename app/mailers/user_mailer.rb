class UserMailer < ActionMailer::Base

  default from: 'notifications@localhost.com'

  def welcome_email(user)
    @user = user


    mail(to: @user.email, subject: 'Welcome to Rantly')
  end

end