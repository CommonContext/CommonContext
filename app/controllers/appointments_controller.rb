class AppointmentsController < ApplicationController
  before_action :set_auth

  def show
    @appointment = Appointment.find(params[:id])
  end


# currently this is routing to mentee profile since we
# are immediately booking the appointment. If we 
# require confirmation and this becomes a request, we will
# move this logic to a custom action like #request_appointment
# and only create the appointment on Mentor confirmation

  def create
    @match = Match.find_by(params[:id])
    @appointment = Appointment.create!(location: "Peets coffee", mentor_rating: 4, mentee_rating: 3, mentor_id: @match.mentor.id, mentee_id: @match.mentee.id, datetime: DateTime.now)
    redirect_to  mentee_path(id: @match.mentee.id)
  end
end