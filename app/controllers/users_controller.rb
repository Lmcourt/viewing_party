class UsersController < ApplicationController
  skip_before_action :require_user, only: %i[new create]

  def new
    @user = User.new
  end

  def create
    @user = User.new(user_params.merge(avatar))
    if @user.save
      UserMailer.with(user: @user).welcome_email.deliver_now
      session[:user_id] = @user.id
      flash[:success] = "Welcome #{@user.email}!"
      redirect_to dashboard_path
    else
      flash[:danger] = 'Invalid credentials. Please try again.'
      redirect_to registration_path
    end
  end

  def show
    @parties = current_user.parties
  end

  private

  def avatar
    {
      avatar: ImageFacade.image
    }
  end

  def user_params
    params.require(:user).permit(:email, :password, :password_confirmation)
  end
end
