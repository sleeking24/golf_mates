class HolesResultsController < ApplicationController
  before_action :set_holes_result, only: %i[show edit update destroy]

  def index
    @q = HolesResult.ransack(params[:q])
    @holes_results = @q.result(distinct: true).includes(:round,
                                                        :shots).page(params[:page]).per(10)
  end

  def show
    @shot = Shot.new
  end

  def new
    @holes_result = HolesResult.new
  end

  def edit; end

  def create
    @holes_result = HolesResult.new(holes_result_params)

    if @holes_result.save
      message = "HolesResult was successfully created."
      if Rails.application.routes.recognize_path(request.referer)[:controller] != Rails.application.routes.recognize_path(request.path)[:controller]
        redirect_back fallback_location: request.referer, notice: message
      else
        redirect_to @holes_result, notice: message
      end
    else
      render :new
    end
  end

  def update
    if @holes_result.update(holes_result_params)
      redirect_to @holes_result,
                  notice: "Holes result was successfully updated."
    else
      render :edit
    end
  end

  def destroy
    @holes_result.destroy
    message = "HolesResult was successfully deleted."
    if Rails.application.routes.recognize_path(request.referer)[:controller] != Rails.application.routes.recognize_path(request.path)[:controller]
      redirect_back fallback_location: request.referer, notice: message
    else
      redirect_to holes_results_url, notice: message
    end
  end

  private

  def set_holes_result
    @holes_result = HolesResult.find(params[:id])
  end

  def holes_result_params
    params.require(:holes_result).permit(:round_id, :hole_number,
                                         :number_of_strokes)
  end
end
