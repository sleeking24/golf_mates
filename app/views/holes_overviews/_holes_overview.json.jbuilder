json.extract! holes_overview, :id, :hole_number, :distance_to_hole,
              :distance_to_green, :golf_course_id, :created_at, :updated_at
json.url holes_overview_url(holes_overview, format: :json)
