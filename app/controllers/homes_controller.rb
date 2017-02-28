class HomesController < ApplicationController
  before_action :set_auth
  before_action :check
  def index
  end
  
  def check
    if current_user != nil && (find_mentor_uids.include?(@auth["uid"]))
      u = User.find_by(uid: @auth["uid"])
      m = u.mentors
      mentor_id = m.ids[0]
      redirect_to mentor_url(id: mentor_id)

    elsif current_user != nil && (find_mentee_uids.include?(@auth["uid"]))
      u = User.find_by(uid: @auth["uid"])
      m = u.mentees
      mentee_id = m.ids[0]
      redirect_to mentee_url(id: mentee_id)
    end
  end

  def find_mentor_uids
    mentors = Mentor.all
    mentor_id_list = []
    mentors.each do |mentor|
      if mentor.user != nil
        mentor_id_list << mentor.user.uid
      end
    end
    return mentor_id_list
  end
  
  def find_mentee_uids
    mentees = Mentee.all
    mentee_id_list = []
    mentees.each do |mentee|
      if mentee.user != nil
        mentee_id_list << mentee.user.uid
      end
    end    
    return mentee_id_list
  end

  private

  helper_method :find_mentor_uids, :find_mentee_uids
end
