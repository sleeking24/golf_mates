json.extract! shot, :id, :shot_distance, :shot_results, :distance_to_green,
              :shot_type, :hole_id, :created_at, :updated_at
json.url shot_url(shot, format: :json)
