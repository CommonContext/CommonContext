class AppointmentsController < ApplicationController
  before_action :set_auth #, :find_mentor

  def index
  end

  def new
    @appointment = Appointment.new
  end

  def create # This is needs to be shelved until we get he mentee matching flow working
    @appointment = Appointment.new(appointment_params)
    @appointment.mentor_id = @mentor.id
    if @appointment.save
      redirect_to mentor_path(@mentor)
    else
      p "Not being saved"
      render :new
    end
  end

  def show

    @appointment = Appointment.find(params[:id])
  end

  def users_appointments
    # JSON endpoint that returns confirmed appointments for 
    # the logged in user
    user_id = session[:user_id]
    @user_appointments = []

    if user_id != nil && user_type == "mentor"
      appointments = Appointment.where(mentor_id: user_id)
      appointments.each do |appointment|
        @user_appointments << {title: "Mentor Apointment Title", start: appointment.datetime}
      end
    elsif user_id !=nil && user_type == "mentee"
      appointments = Appointment.where(mentee_id: user_id)
      appointments.each do |appointment|
        puts appointment.datetime
        @user_appointments << {title: "Mentee Apointment Title", start: appointment.datetime}
      end
    end

    respond_to do |format|
      format.json { render json: @user_appointments, status: :ok }
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
    params.require(:appointment).permit(:datetime, :location, :mentor_id)
  end


end