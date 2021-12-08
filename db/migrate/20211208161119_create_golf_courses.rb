class CreateGolfCourses < ActiveRecord::Migration[6.0]
  def change
    create_table :golf_courses do |t|
      t.string :name
      t.text :description
      t.string :location
      t.string :photo

      t.timestamps
    end
  end
end
