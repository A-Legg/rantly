class UserMailer < ActionMailer::Base

  default from: 'notifications@localhost.com'


  def welcome_email(user)
    @user = user
    mail(to: @user.email, subject: 'Welcome to Rantly')
  end


  def confirmation_email(user, url)
    @user = user
    @confirmation_url = url
    mail(to: @user.email, subject: "Confirming your email")
  end

  def followed_email(user, rant)
    @rant = rant

    mail(to: user.email, subject: "New Rant from #{rant.user.username}")
  end


end