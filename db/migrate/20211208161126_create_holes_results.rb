class CreateHolesResults < ActiveRecord::Migration[6.0]
  def change
    create_table :holes_results do |t|
      t.integer :round_id
      t.integer :hole_number
      t.integer :number_of_strokes

      t.timestamps
    end
  end
end
