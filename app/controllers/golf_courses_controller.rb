class GolfCoursesController < ApplicationController
  before_action :set_golf_course, only: %i[show edit update destroy]

  def index
    @q = GolfCourse.ransack(params[:q])
    @golf_courses = @q.result(distinct: true).includes(:holes_overviews,
                                                       :rounds).page(params[:page]).per(10)
    @location_hash = Gmaps4rails.build_markers(@golf_courses.where.not(location_latitude: nil)) do |golf_course, marker|
      marker.lat golf_course.location_latitude
      marker.lng golf_course.location_longitude
    end
  end

  def show
    @round = Round.new
    @holes_overview = HolesOverview.new
  end

  def new
    @golf_course = GolfCourse.new
  end

  def edit; end

  def create
    @golf_course = GolfCourse.new(golf_course_params)

    if @golf_course.save
      redirect_to @golf_course, notice: "Golf course was successfully created."
    else
      render :new
    end
  end

  def update
    if @golf_course.update(golf_course_params)
      redirect_to @golf_course, notice: "Golf course was successfully updated."
    else
      render :edit
    end
  end

  def destroy
    @golf_course.destroy
    redirect_to golf_courses_url,
                notice: "Golf course was successfully destroyed."
  end

  private

  def set_golf_course
    @golf_course = GolfCourse.find(params[:id])
  end

  def golf_course_params
    params.require(:golf_course).permit(:name, :description, :location,
                                        :photo)
  end
end
