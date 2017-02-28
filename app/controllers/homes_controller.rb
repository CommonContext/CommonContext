class HomesController < ApplicationController
  before_action :set_auth
  
  def index
  end

  def finish_registration
    render "_show"
  end

end
