class AppointmentsController < ApplicationController
  before_action :set_auth, :find_mentor

  def index
  end

  # def new
  #   @appointment = Appointment.new
  # end

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

# currently this is routing to mentee profile since we
# are immediately booking the appointment. If we
# require confirmation and this becomes a request, we will
# move this logic to a custom action like #request_appointment
# and only create the appointment on Mentor confirmation
  def new
    @appointment = Appointment.new
    @mentor = Mentor.new
  end


  # def create
    # @appointment = Appointment.new(appointment_params)
    # @appointment.mentor_id = session[:user_id]
     # @concert = Concert.find(params[:concert_id])
    # @appointment = Appointment.new(datetime: params[:datetime], location: params[:location], mentor: params[:mentor_id])
    # if @appointment.save
    #   redirect_to mentor_path(params[:mentor_id])
    # end
    # @match = Match.find_by(params[:id])
    # @appointment = Appointment.create!(location: "Peets coffee", mentor_rating: 4, mentee_rating: 3, mentor_id: @match.mentor.id, mentee_id: @match.mentee.id, datetime: DateTime.now)
    # redirect_to  mentee_path(id: @match.mentee.id)
  # end

  # def edit
  #   if session[:user_id] != nil
  #     @appointment = Appointment.find(params[:id])
  #   else
  #     redirect_to login_url
  #   end
  # end

  # def update
  #   if session[:user_id] != @appointment.mentor_id
  #     @user = User.find(session[:user_id])
  #     @appointment.update_attributes(student: @user)
  #     redirect_to appointment_path(@appointment)
  #   else
  #     @appointment.update_attributes(appointment_params)
  #     redirect_to appointment_path(@appointment)
  #   end
  # end
  

  private

  def find_mentor
    @mentor = Mentor.find(params[:mentor_id])
  end

  def appointment_params
    params.require(:appointment).permit(:datetime, :location, :mentor_id)
  end

end

