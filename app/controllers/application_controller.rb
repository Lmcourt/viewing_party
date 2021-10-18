class ApplicationController < ActionController::Base
  protect_from_forgery with: :exception
  helper_method :current_user
  add_flash_types :success, :danger
  before_action :require_user

  private

  def current_user
    @current_user ||= User.find(session[:user_id]) if session[:user_id]
  end

  def require_user
    permission_denied unless current_user
  end

  def permission_denied
    redirect_to root_path, alert: 'Please login or create an account.'
  end
end
