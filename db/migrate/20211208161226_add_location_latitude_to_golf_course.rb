class AddLocationLatitudeToGolfCourse < ActiveRecord::Migration[6.0]
  def change
    add_column :golf_courses, :location_latitude, :float
  end
end
