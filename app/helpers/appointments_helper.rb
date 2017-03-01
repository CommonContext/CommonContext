module AppointmentsHelper

  def available_appointments(this_match)
    @mentor = Mentor.find(this_match.mentor_id)
    @empty = @mentor.appointments.where("mentee_id IS NULL AND mentor_id = ?", @mentor.id)
  end
end