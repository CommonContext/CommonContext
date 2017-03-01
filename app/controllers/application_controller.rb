class ApplicationController < ActionController::Base
  include UsersHelper
  include SessionsHelper
  include AppointmentsHelper
  protect_from_forgery with: :exception

end
