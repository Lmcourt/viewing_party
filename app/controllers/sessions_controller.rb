class SessionsController < ApplicationController
  skip_before_action :require_user, except: :destroy

  def new; end

  def create
    user = User.find_by(email: params[:email])
    if user.present? && user.authenticate(params[:password])
      session[:user_id] = user.id
      flash[:success] = "Welcome back, #{user.email}!"
      redirect_to dashboard_path
    else
      flash[:danger] = 'Invalid email or password.'
      redirect_to login_path
    end
  end

  def destroy
    session[:user_id] = nil
    redirect_to root_path
  end
end
