class HolesOverviewsController < ApplicationController
  before_action :set_holes_overview, only: [:show, :edit, :update, :destroy]

  # GET /holes_overviews
  def index
    @holes_overviews = HolesOverview.all
  end

  # GET /holes_overviews/1
  def show
  end

  # GET /holes_overviews/new
  def new
    @holes_overview = HolesOverview.new
  end

  # GET /holes_overviews/1/edit
  def edit
  end

  # POST /holes_overviews
  def create
    @holes_overview = HolesOverview.new(holes_overview_params)

    if @holes_overview.save
      redirect_to @holes_overview, notice: 'Holes overview was successfully created.'
    else
      render :new
    end
  end

  # PATCH/PUT /holes_overviews/1
  def update
    if @holes_overview.update(holes_overview_params)
      redirect_to @holes_overview, notice: 'Holes overview was successfully updated.'
    else
      render :edit
    end
  end

  # DELETE /holes_overviews/1
  def destroy
    @holes_overview.destroy
    redirect_to holes_overviews_url, notice: 'Holes overview was successfully destroyed.'
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_holes_overview
      @holes_overview = HolesOverview.find(params[:id])
    end

    # Only allow a trusted parameter "white list" through.
    def holes_overview_params
      params.require(:holes_overview).permit(:hole_number, :distance_to_hole, :distance_to_green, :golf_course_id)
    end
end
