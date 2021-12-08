class AddHoleReferenceToShots < ActiveRecord::Migration[6.0]
  def change
    add_foreign_key :shots, :holes_results, column: :hole_id
    add_index :shots, :hole_id
    change_column_null :shots, :hole_id, false
  end
end
