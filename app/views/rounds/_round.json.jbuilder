json.extract! round, :id, :course_id, :user_id, :score, :best_hole,
              :worst_hole, :reason_wonlost, :best_hole_description, :worst_hole_description, :created_at, :updated_at
json.url round_url(round, format: :json)
