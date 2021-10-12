class UsersController < ApplicationController
  def new
    @user = User.new
  end

  def create
    @user = User.new(user_params)
    if @user.save
      session[:user_id] = @user.id
      flash[:success] = "Welcome #{@user.email}!"
      redirect_to dashboard_path(@user)
    else
      flash[:danger] = 'Invalid credentials. Please try again.'
      redirect_to registration_path
    end
  end

  def show

  end

  private

  def user_params
    params.require(:user).permit(:email, :password, :password_confirmation)
  end
end
