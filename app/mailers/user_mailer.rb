class UserMailer < ApplicationMailer
  default from: 'moviewithfriends@app.com'

  def welcome_email
    @user = params[:user]
    @url = 'https://movie-with-friends.herokuapp.com/login'
    mail(to: @user.email, subject: 'Welcome to Movie With Friends!')
  end
end
