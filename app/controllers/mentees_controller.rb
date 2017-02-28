class MenteesController < ApplicationController
  before_action :set_mentee, only: [:show, :edit, :update, :destroy]
  before_action :set_auth

  def new
    @mentee = Mentee.new
  end

  def create
    @mentee = Mentee.new(mentee_params)
    respond_to do |format|
      if @mentee.save
        format.html { redirect_to @mentee }
        format.json { render :show, status: :created, location: @mentee }
      else
        format.html { render :new }
        format.json { render json: @mentee.errors, status: :unprocessable_entity }
      end
    end
  end

  def show
  end

  def update
  respond_to do |format|
    if @mentee.update_attributes(mentee_params)
      format.html { redirect_to @mentee }
      format.json { render :show, status: :ok, location: @mentee }
    else
      format.html { render :edit }
      format.json { render json: @mentee.errors, status: :unprocessable_entity }
    end
  end
end

   private
    def set_mentee
      @mentee = Mentee.find(params[:id])
    end

    def mentee_params
      params.require(:mentee).permit(:first_name,
                                    :last_name,
                                    :email,
                                    :objective,
                                    :mentor_demographic_pref,
                                    :race,
                                    :gender,
                                    :linkedin_link,
                                    :socioeconomic_background,
                                    :orientation,
                                    :other,
                                    :location,
                                    :interests,
                                    :user_id)

  end

  
end
