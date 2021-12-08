class CreateHolesOverviews < ActiveRecord::Migration[6.0]
  def change
    create_table :holes_overviews do |t|
      t.integer :hole_number
      t.float :distance_to_hole
      t.float :distance_to_green
      t.integer :golf_course_id

      t.timestamps
    end
  end
end
