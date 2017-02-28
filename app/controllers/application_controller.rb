class ApplicationController < ActionController::Base
  protect_from_forgery with: :exception

  private

  def current_user
    @current_user ||= User.find(session[:user_id]) if session[:user_id]
  end

  def set_auth
    @auth = session[:omniauth] if session[:omniauth]
  end

  helper_method :current_user
end
