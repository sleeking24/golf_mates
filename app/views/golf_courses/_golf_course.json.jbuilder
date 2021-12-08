json.extract! golf_course, :id, :name, :description, :location, :photo, :created_at, :updated_at
json.url golf_course_url(golf_course, format: :json)
