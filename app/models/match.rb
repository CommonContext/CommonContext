class Match < ApplicationRecord
  belongs_to :mentor
  belongs_to :mentee

# TODO: refactor. Algorithm depends on default fields
# existing on the mentee and mentor model, and need to handle case when they haven't been specified
# we also won't want to load our entire mentor table everytime this
# is called

  def mentor_matches(mentee)
    mentors = Mentor.all 
    matches = []
    
    # Coding out while loop for faster debugging purposes, 
    # though for refactor it's important to consider cases
    # where no matches are found
    # while matches.length <= 1
      mentors.each do |mentor|
        if mentor.race == mentee.race
          matches.push(mentor)
        elsif mentor.socioeconomic_background == mentee.socioeconomic_background
          matches.push(mentor)
        elsif mentor.gender == mentee.gender
          matches.push(mentor)
        elsif mentor.orientation == mentee.orientation
          matches.push(mentor)
        end
      end
    # end
    matches
  end
end
