class AppointmentsController < ApplicationController
  before_action :set_auth
  before_action :find_mentor, only: [:new, :create]
  # skip_before_filter :verify_authenticity_token
  
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
    puts "*" * 50
    puts @appointment.mentor.email
    @email = @appointment.mentor.email
    NotificationMailer.welcome_email(@email).deliver_now
  end

  def show
    @appointment = Appointment.find(params[:id])
  end

  def schedule
    @appointment = Appointment.find(params[:id])
    if @appointment.update(mentee_id: params[:mentee_id])
      puts "*" * 50
      puts "menteee is here"
      puts @appointment.mentee.email
      @email = @appointment.mentee.email
      NotificationMailer.welcome_email(@email).deliver_now
      redirect_to mentee_path(id: params[:mentee_id])

    else
      redirect_to mentee_match(mentee_id: params[:mentee_id], id: params[:match_id])
    end
  end

  def update
    new_date = params[:new_date]
    appointment_id = params[:appointment_id]

    appointment = Appointment.find(appointment_id)
    if !appointment
      # Return error
    end

    appointment.datetime = new_date
    appointment.save()

    # Render success json
  end

  def users_appointments
    # JSON endpoint that returns confirmed appointments for
    # the logged in user
    user_id = session[:user_id]
    @user_appointments = []

    if user_id != nil && user_type == "mentor"
      mentor = Mentor.find_by(user_id: session[:user_id])
      appointments = Appointment.where(mentor_id: mentor.id)
      appointments.each do |appointment|
        @user_appointments << {id: appointment.id, title: "Mentor Apointment Title", start: appointment.datetime}
      end
    elsif user_id !=nil && user_type == "mentee"
      mentee = Mentee.find_by(user_id: session[:user_id])
      appointments = Appointment.where(mentee_id: mentee.id)
      appointments.each do |appointment|
        puts appointment.datetime
        @user_appointments << {id: appointment.id, title: "Mentee Apointment Title", start: appointment.datetime}
      end
    end

    respond_to do |format|
      format.json { render json: @user_appointments, status: :ok }
    end
  end

  private

  def find_mentor
    @mentor = Mentor.find(params[:mentor_id])
  end

  def appointment_params
    params.require(:appointment).permit(:datetime, :location, :mentor_id, :mentee_id)
  end


end
