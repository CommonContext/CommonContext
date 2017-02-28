module UsersHelper


## reminder: eventually index the uid on the users table
def route_user
    set_auth
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
    else
      redirect_to finish_registration_path

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

  def set_auth
    @auth = session[:omniauth] if session[:omniauth]
  end
end