class ShotsController < ApplicationController
  before_action :set_shot, only: %i[show edit update destroy]

  def index
    @q = Shot.ransack(params[:q])
    @shots = @q.result(distinct: true).includes(:hole).page(params[:page]).per(10)
  end

  def show; end

  def new
    @shot = Shot.new
  end

  def edit; end

  def create
    @shot = Shot.new(shot_params)

    if @shot.save
      message = "Shot was successfully created."
      if Rails.application.routes.recognize_path(request.referer)[:controller] != Rails.application.routes.recognize_path(request.path)[:controller]
        redirect_back fallback_location: request.referer, notice: message
      else
        redirect_to @shot, notice: message
      end
    else
      render :new
    end
  end

  def update
    if @shot.update(shot_params)
      redirect_to @shot, notice: "Shot was successfully updated."
    else
      render :edit
    end
  end

  def destroy
    @shot.destroy
    message = "Shot was successfully deleted."
    if Rails.application.routes.recognize_path(request.referer)[:controller] != Rails.application.routes.recognize_path(request.path)[:controller]
      redirect_back fallback_location: request.referer, notice: message
    else
      redirect_to shots_url, notice: message
    end
  end

  private

  def set_shot
    @shot = Shot.find(params[:id])
  end

  def shot_params
    params.require(:shot).permit(:shot_distance, :shot_results,
                                 :distance_to_green, :shot_type, :hole_id)
  end
end
