class CreateShots < ActiveRecord::Migration[6.0]
  def change
    create_table :shots do |t|
      t.float :shot_distance
      t.string :shot_results
      t.float :distance_to_green
      t.string :shot_type
      t.integer :hole_id

      t.timestamps
    end
  end
end
