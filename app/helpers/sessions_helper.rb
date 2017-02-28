module SessionsHelper

 def current_user
    @current_user ||= User.find(session[:user_id]) if session[:user_id]
  end

  def log_out
    session.clear
  end

end