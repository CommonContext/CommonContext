class Mentee < ApplicationRecord
  has_many :matches
  has_many :appointments

# - create a method to find 3 mentors
# - iterate through mentors
# - match is determined by a race/socioeconomic_background/orientation field the mentor or mentee
# have in common
# - push the first three matches found to an empty array

	def mentor_matches(mentors)
		# @mentors = Mentor.all 
		# @user = Mentee.find(params[:mentee_id])
		matches = []
		
		while matches.length <= 1
			mentors.each do |mentor|
				if mentor.race == self.race
					matches.push(mentor)
				elsif mentor.socioeconomic_background == self.socioeconomic_background
					matches.push(mentor)
				elsif mentor.gender == self.gender
					matches.push(mentor)
				elsif mentor.orientation == self.orientation
					matches.push(mentor)
				end
			end
		end
# we have an array of matches
# we need to iterate through that array
# for each item, create a new Match record
# using the mentor id and the user id
		matches
	end

end
