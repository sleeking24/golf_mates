json.extract! holes_result, :id, :round_id, :hole_number, :number_of_strokes,
              :created_at, :updated_at
json.url holes_result_url(holes_result, format: :json)
