class AddRoundReferenceToHolesResults < ActiveRecord::Migration[6.0]
  def change
    add_foreign_key :holes_results, :rounds
    add_index :holes_results, :round_id
    change_column_null :holes_results, :round_id, false
  end
end
