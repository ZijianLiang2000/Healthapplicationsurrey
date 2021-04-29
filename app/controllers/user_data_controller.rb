class UserDataController < ApplicationController
  before_action :set_user_datum, only: %i[ show edit update destroy ]
  
  # GET /user_data or /user_data.json
  def index
    @user_data = UserDatum.all
    @user_data = UserDatum.user_user_data(current_user)
  end

  # GET /user_data/1 or /user_data/1.json
  def show
  end

  # GET /user_data/new
  def new
    @user_datum = UserDatum.new
  end

  # GET /user_data/1/edit
  def edit
  end

  # POST /user_data or /user_data.json
  def create
    @user_datum = UserDatum.new(user_datum_params)
    @user_datum.user=current_user

    # User datum does not have field "duration_score", so it can be speculated according to "duration_pref"
    @user_datum_duration_score = 1 if @user_datum.duration_pref == 15
    @user_datum_duration_score = 3 if @user_datum.duration_pref == 30
    @user_datum_duration_score = 5 if @user_datum.duration_pref == 60

    # If user daily questionnaire is not created yet, create an initial version of it
    # and copy the common score variables of user data to the new daily questionnaire

    if UserDailyQuestionnaire.where(user: current_user).first == nil
      # Fields which were not specified in this table would be average values in the UDQ table
      @initial_user_daily_questionnaire = UserDailyQuestionnaire.new(user: current_user, user_mood: 3, day_of_week: Date.today.strftime('%A'),
      questionnaire_date: Date.today, duration_mins: @user_datum.duration_pref, duration_score: @user_datum_duration_score,
      indoor_score: @user_datum.indoor_score, outdoor_score: @user_datum.outdoor_score, cardio_score: @user_datum.cardio_score,
      strength_score: @user_datum.strength_score, physicality_score: @user_datum.physicality_score, mentality_score: @user_datum.mentality_score,
      solo_score: @user_datum.solo_score, team_score: @user_datum.team_score, intensity_score: @user_datum.intensity_score)
      @initial_user_daily_questionnaire.save!
      
    end

    respond_to do |format|
      if @user_datum.save
        format.html { redirect_to @user_datum, notice: "User datum was successfully created." }
        format.json { render :show, status: :created, location: @user_datum }
      else
        format.html { render :new, status: :unprocessable_entity }
        format.json { render json: @user_datum.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /user_data/1 or /user_data/1.json
  def update
    respond_to do |format|
      if @user_datum.update(user_datum_params)
        format.html { redirect_to @user_datum, notice: "User datum was successfully updated." }
        format.json { render :show, status: :ok, location: @user_datum }
      else
        format.html { render :edit, status: :unprocessable_entity }
        format.json { render json: @user_datum.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /user_data/1 or /user_data/1.json
  def destroy
    @user_datum.destroy
    @daily_questionnaire=UserDailyQuestionnaire.where(user: current_user).first
    # Destroy daily questionnaire with user data, FOR TESTING, CAN BE CHANGED IN FINAL VERSION
    @daily_questionnaire.destroy if UserDailyQuestionnaire.where(user: current_user).first != nil
      
      
    respond_to do |format|
      format.html { redirect_to user_data_url, notice: "User datum was successfully destroyed." }
      format.json { head :no_content }
    end
  end


  private
    # Use callbacks to share common setup or constraints between actions.
    def set_user_datum
      @user_datum = UserDatum.find(params[:id])
    end

    # Only allow a list of trusted parameters through.
    def user_datum_params
      params.require(:user_datum).permit(:height, :weight, :age, :gender, :athletic_lvl, :physical, :mental, :indoor_score, :outdoor_score,:cardio_score,:strength_score,:physicality_score,:mentality_score,:solo_score,:team_score,:intensity_score ,:frequency_pref, :duration_pref, :BMI)
    end

end
