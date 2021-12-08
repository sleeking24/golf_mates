class AddLocationLongitudeToGolfCourse < ActiveRecord::Migration[6.0]
  def change
    add_column :golf_courses, :location_longitude, :float
  end
end
