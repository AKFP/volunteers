class UserMailer < ApplicationMailer
  default from: 'noreply.ofsp-app@alkhidmat.org'

  def welcome_email user
    @user = user

    mail(to: @user.email, subject: 'Welcome to Volunteer Data Management')
  end
end
