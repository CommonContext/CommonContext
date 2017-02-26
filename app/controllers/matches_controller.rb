class MatchesController < ApplicationController
	
	def index
		@matches = Match.mentor_matches
		@matches.each do |match|
			
		end
	end

end