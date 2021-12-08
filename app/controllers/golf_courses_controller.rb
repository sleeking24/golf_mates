class GolfCoursesController < ApplicationController
  before_action :set_golf_course, only: [:show, :edit, :update, :destroy]

  # GET /golf_courses
  def index
    @golf_courses = GolfCourse.all
  end

  # GET /golf_courses/1
  def show
    @round = Round.new
    @holes_overview = HolesOverview.new
  end

  # GET /golf_courses/new
  def new
    @golf_course = GolfCourse.new
  end

  # GET /golf_courses/1/edit
  def edit
  end

  # POST /golf_courses
  def create
    @golf_course = GolfCourse.new(golf_course_params)

    if @golf_course.save
      redirect_to @golf_course, notice: 'Golf course was successfully created.'
    else
      render :new
    end
  end

  # PATCH/PUT /golf_courses/1
  def update
    if @golf_course.update(golf_course_params)
      redirect_to @golf_course, notice: 'Golf course was successfully updated.'
    else
      render :edit
    end
  end

  # DELETE /golf_courses/1
  def destroy
    @golf_course.destroy
    redirect_to golf_courses_url, notice: 'Golf course was successfully destroyed.'
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_golf_course
      @golf_course = GolfCourse.find(params[:id])
    end

    # Only allow a trusted parameter "white list" through.
    def golf_course_params
      params.require(:golf_course).permit(:name, :description, :location, :photo)
    end
end
