class MentorsController < ApplicationController
  before_action :find_mentor, only: [:show, :edit, :update]
  before_action :set_auth

  def new
    @mentor = Mentor.new
  end

  def create
    @mentor = Mentor.new(mentor_params)
    @mentor.user_id = User.find_by(uid: @auth['uid']).id
    respond_to do |format|
      if @mentor.save
        format.html { redirect_to @mentor }
        format.json { render :show, status: :created, location: @mentor }
      else
        format.html { render :new }
        format.json { render json: @mentor.errors, status: :unprocessable_entity }
      end
    end
  end

  def show
  end

  def edit
  end

  def update
    respond_to do |format|
      if @mentor.update(mentor_params)
        format.html { redirect_to @mentor }
        format.json { render :show, status: :ok, location: @mentor }
      else
        format.html { render :edit }
        format.json { render json: @mentor.errors, status: :unprocessable_entity }
      end
    end
  end

  private

    def find_mentor
      @mentor = Mentor.find(params[:id])
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
                                    :other
                                    )
    end

end
