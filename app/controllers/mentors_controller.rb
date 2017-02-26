class MentorsController < ApplicationController
  before_action :find_mentor, only: [:show, :edit, :destroy]
  before_action :set_auth

  # def index
  #   @mentors = Mentor.all
  #   render json: @mentors
  # end

  def new
    @mentor = Mentor.new
  end

  def create
    @mentor = Mentor.new(mentor_params)

    respond_to do |format|
      if @mentor.save
        format.html { redirect_to @mentor, notice: 'Mentor was successfully created.' }
        format.json { render :show, status: :created, location: @mentor }
      else
        format.html { render :new }
        format.json { render json: @mentor.errors, status: :unprocessable_entity }
      end
    end
  end

  def show
    @mentor = Mentor.find(1)
    # render json:@mentor
    render :show
  end

  def edit
  end

  def update
    if @mentor.update(mentor_params)
      render json: @mentor
    else
      redirect_to 'edit'
    end
  end

  def destroy
    @mentor.destroy
    redirect_to root_path
  end


  private

  def find_mentor
    @mentor = Mentor.find(1)
    # @mentor = Mentor.find(params[:id])
  end

  def mentor_params
    params.require(:mentor).permit(:first_name,
                                  :last_name,
                                  :email,
                                  :years_of_experience,
                                  :current_company,
                                  :current_industry,
                                  :linkedin_link,
                                  :race,
                                  :gender,
                                  :socioeconomic_background,
                                  :orientation,
                                  :location,
                                  :interests,
                                  :availability,
                                  :other)
  end

  private

  def set_auth
    @auth = session[:omniauth] if session[:omniauth]
  end

end
