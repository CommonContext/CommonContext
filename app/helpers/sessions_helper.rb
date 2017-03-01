module SessionsHelper

 def current_user
    @current_user ||= User.find(session[:user_id]) if session[:user_id]
  end

  def set_user_type(type)
    session[:type] = type
  end

  def log_out
    session.clear
  end

  def user_type
    session[:type]
  end

end