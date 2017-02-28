class MatchesController < ApplicationController
	before_action :set_auth
	def show
		@match = Match.find(params[:id])
		@mentee = Mentee.find(params[:mentee_id])
	end	

	def get_matches
		@mentee = Mentee.find(params[:id])
		@match = Match.new
		@mentor_matches = @match.mentor_matches(@mentee) 
	end

	def create
		@mentee =  Mentee.find(params[:mentee_id])
		@match = @mentee.matches.new(mentor_id: params[:mentor], mentee_id: params[:mentee_id])
		if @match.save
			redirect_to mentee_match_path(id: @match.id)
		end
	end
  
  private


end