module SessionsHelper

  def current_user
    @current_user ||= User.find(session[:user_id]) if session[:user_id]
  end

  def get_user 
    if user_type == "mentor"
      @this_user = Mentor.find_by(user_id: session[:user_id])
    elsif user_type == "mentee"
      @this_user = Mentee.find_by(user_id: session[:user_id])
    else
      route_user
    end
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