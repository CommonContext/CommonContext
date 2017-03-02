class SessionsController < ApplicationController
  
  def create
    auth = request.env["omniauth.auth"]
    session[:omniauth] = auth.except('extra')
    user = User.sign_in_from_omniauth(auth)
    session[:user_id] = user.id
    route_user
    
  end

  def destroy
    log_out
    redirect_to root_url
  end

end