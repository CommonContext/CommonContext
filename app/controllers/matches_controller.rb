class MatchesController < ApplicationController
	
	def index
		@mentee = Mentee.find(params[:mentee_id])
		@mentors = Mentor.all
		@matches = @mentee.mentor_matches(@mentors)

		# @matches.each do |mentor|
		# 	Match.create(mentee_id: @mentee.id, mentor_id: mentor.id)
		# end
	end

	def new
		@match = Match.new
	end

	def create
		@mentee = Mentee.find(params[:mentee_id])
		@mentors = Mentor.all
		@matches = @mentee.mentor_matches(@mentors)
	end

end