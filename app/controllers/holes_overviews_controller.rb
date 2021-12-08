class HolesOverviewsController < ApplicationController
  before_action :set_holes_overview, only: %i[show edit update destroy]

  def index
    @q = HolesOverview.ransack(params[:q])
    @holes_overviews = @q.result(distinct: true).includes(:golf_course).page(params[:page]).per(10)
  end

  def show; end

  def new
    @holes_overview = HolesOverview.new
  end

  def edit; end

  def create
    @holes_overview = HolesOverview.new(holes_overview_params)

    if @holes_overview.save
      message = "HolesOverview was successfully created."
      if Rails.application.routes.recognize_path(request.referer)[:controller] != Rails.application.routes.recognize_path(request.path)[:controller]
        redirect_back fallback_location: request.referer, notice: message
      else
        redirect_to @holes_overview, notice: message
      end
    else
      render :new
    end
  end

  def update
    if @holes_overview.update(holes_overview_params)
      redirect_to @holes_overview,
                  notice: "Holes overview was successfully updated."
    else
      render :edit
    end
  end

  def destroy
    @holes_overview.destroy
    message = "HolesOverview was successfully deleted."
    if Rails.application.routes.recognize_path(request.referer)[:controller] != Rails.application.routes.recognize_path(request.path)[:controller]
      redirect_back fallback_location: request.referer, notice: message
    else
      redirect_to holes_overviews_url, notice: message
    end
  end

  private

  def set_holes_overview
    @holes_overview = HolesOverview.find(params[:id])
  end

  def holes_overview_params
    params.require(:holes_overview).permit(:hole_number, :distance_to_hole,
                                           :distance_to_green, :golf_course_id)
  end
end
