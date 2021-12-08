class ShotsController < ApplicationController
  before_action :set_shot, only: [:show, :edit, :update, :destroy]

  # GET /shots
  def index
    @shots = Shot.all
  end

  # GET /shots/1
  def show
  end

  # GET /shots/new
  def new
    @shot = Shot.new
  end

  # GET /shots/1/edit
  def edit
  end

  # POST /shots
  def create
    @shot = Shot.new(shot_params)

    if @shot.save
      message = 'Shot was successfully created.'
      if Rails.application.routes.recognize_path(request.referrer)[:controller] != Rails.application.routes.recognize_path(request.path)[:controller]
        redirect_back fallback_location: request.referrer, notice: message
      else
        redirect_to @shot, notice: message
      end
    else
      render :new
    end
  end

  # PATCH/PUT /shots/1
  def update
    if @shot.update(shot_params)
      redirect_to @shot, notice: 'Shot was successfully updated.'
    else
      render :edit
    end
  end

  # DELETE /shots/1
  def destroy
    @shot.destroy
    message = "Shot was successfully deleted."
    if Rails.application.routes.recognize_path(request.referrer)[:controller] != Rails.application.routes.recognize_path(request.path)[:controller]
      redirect_back fallback_location: request.referrer, notice: message
    else
      redirect_to shots_url, notice: message
    end
  end


  private
    # Use callbacks to share common setup or constraints between actions.
    def set_shot
      @shot = Shot.find(params[:id])
    end

    # Only allow a trusted parameter "white list" through.
    def shot_params
      params.require(:shot).permit(:shot_distance, :shot_results, :distance_to_green, :shot_type, :hole_id)
    end
end
