class SessionsController < ApplicationController
  def create
    puts "createeeeeeeeeeeeeeeeeeeeee"
    auth = request.env["omniauth.auth"]
    session[:omniauth] = auth.except('extra')
    user = User.sign_in_from_omniauth(auth)
    session[:user_id] = user.id
    redirect_to root_url, notice: "SIGNED IN"
    puts "session[:user_id]"
  end

  def destroy
    session[:user_id] = nil
    session[:omniauth] = nil
    redirect_to root_url, notice: "SIGNED OUT"
  end
end