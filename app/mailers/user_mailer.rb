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

  def followed_email(users, rant)
    @users = users
    @followed_user = rant.user.username
    @url = rant_url(rant.id)
    mail(to: @users, subject: "New Rant from #{@followed_user}")
  end


end