class CreateRounds < ActiveRecord::Migration[6.0]
  def change
    create_table :rounds do |t|
      t.integer :course_id
      t.integer :user_id
      t.integer :score
      t.integer :best_hole
      t.integer :worst_hole
      t.text :reason_wonlost
      t.string :best_hole_description
      t.string :worst_hole_description

      t.timestamps
    end
  end
end
