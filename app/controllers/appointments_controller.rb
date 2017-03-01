class AppointmentsController < ApplicationController
  before_action :set_auth
  before_action :find_mentor, only: [:new, :create]

  def index
  end

  def new
    @appointment = Appointment.new
  end

  def create 
    @appointment = Appointment.new(appointment_params)
    @appointment.mentor_id = @mentor.id
    if @appointment.save
      redirect_to mentor_path(@mentor)
    else
      render :new
    end
  end

  def show
    @appointment = Appointment.find(params[:id])
  end

  def schedule
    @appointment = Appointment.find(params[:id])
    if @appointment.update(mentee_id: params[:mentee_id])
      redirect_to mentee_path(id: params[:mentee_id])
    else
      redirect_to mentee_match(mentee_id: params[:mentee_id], id: params[:match_id])
    end

  end

# currently this is routing to mentee profile since we
# are immediately booking the appointment. If we
# require confirmation and this becomes a request, we will
# move this logic to a custom action like #request_appointment
# and only create the appointment on Mentor confirmation

  private

  def find_mentor
    @mentor = Mentor.find(params[:mentor_id])
  end

  def appointment_params
    params.require(:appointment).permit(:datetime, :location, :mentor_id, :mentee_id)
  end

end
