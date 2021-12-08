class Api::V1::GolfCoursesController < Api::V1::GraphitiController
  def index
    golf_courses = GolfCourseResource.all(params)
    respond_with(golf_courses)
  end

  def show
    golf_course = GolfCourseResource.find(params)
    respond_with(golf_course)
  end

  def create
    golf_course = GolfCourseResource.build(params)

    if golf_course.save
      render jsonapi: golf_course, status: :created
    else
      render jsonapi_errors: golf_course
    end
  end

  def update
    golf_course = GolfCourseResource.find(params)

    if golf_course.update_attributes
      render jsonapi: golf_course
    else
      render jsonapi_errors: golf_course
    end
  end

  def destroy
    golf_course = GolfCourseResource.find(params)

    if golf_course.destroy
      render jsonapi: { meta: {} }, status: :ok
    else
      render jsonapi_errors: golf_course
    end
  end
end
