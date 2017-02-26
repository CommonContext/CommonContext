class Match < ApplicationRecord
  belongs_to :mentor
  belongs_to :mentee


# - create a method to find 3 mentors
# - iterate through mentors
# - match is determined by a race/socioeconomic_background/orientation field the mentor or mentee
# have in common
# - push the first three matches found to an empty array

	def mentor_matches
		@mentors = Mentor.all 
		@user = Mentee.find(params[:mentee_id])
		matches = []
		
		while matches.length < 3
			@mentors.each do |mentor|
				if mentor.race == @user.race
					matches.push(mentor)
				elsif mentor.socioeconomic_background == @user.socioeconomic_background
					matches.push(mentor)
				elsif mentor.gender == @user.gender
					matches.push(mentor)
				elsif mentor.orientation == @user.orientation
					matches.push(mentor)
				end
			end
		end

		matches.each do 
	return m
	end
end