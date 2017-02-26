class MatchesController < ApplicationController
	
	def index
		@matches = Match.mentor_matches
	end

end