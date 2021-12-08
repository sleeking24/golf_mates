class RoundsController < ApplicationController
  before_action :set_round, only: [:show, :edit, :update, :destroy]

  # GET /rounds
  def index
    @rounds = Round.all
  end

  # GET /rounds/1
  def show
    @holes_result = HolesResult.new
  end

  # GET /rounds/new
  def new
    @round = Round.new
  end

  # GET /rounds/1/edit
  def edit
  end

  # POST /rounds
  def create
    @round = Round.new(round_params)

    if @round.save
      message = 'Round was successfully created.'
      if Rails.application.routes.recognize_path(request.referrer)[:controller] != Rails.application.routes.recognize_path(request.path)[:controller]
        redirect_back fallback_location: request.referrer, notice: message
      else
        redirect_to @round, notice: message
      end
    else
      render :new
    end
  end

  # PATCH/PUT /rounds/1
  def update
    if @round.update(round_params)
      redirect_to @round, notice: 'Round was successfully updated.'
    else
      render :edit
    end
  end

  # DELETE /rounds/1
  def destroy
    @round.destroy
    message = "Round was successfully deleted."
    if Rails.application.routes.recognize_path(request.referrer)[:controller] != Rails.application.routes.recognize_path(request.path)[:controller]
      redirect_back fallback_location: request.referrer, notice: message
    else
      redirect_to rounds_url, notice: message
    end
  end


  private
    # Use callbacks to share common setup or constraints between actions.
    def set_round
      @round = Round.find(params[:id])
    end

    # Only allow a trusted parameter "white list" through.
    def round_params
      params.require(:round).permit(:course_id, :user_id, :score, :best_hole, :worst_hole, :reason_wonlost, :best_hole_description, :worst_hole_description)
    end
end
