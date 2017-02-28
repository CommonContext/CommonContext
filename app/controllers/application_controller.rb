class ApplicationController < ActionController::Base
  include UsersHelper
  include SessionsHelper
  protect_from_forgery with: :exception

end
