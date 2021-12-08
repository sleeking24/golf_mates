class AddUserReferenceToRounds < ActiveRecord::Migration[6.0]
  def change
    add_foreign_key :rounds, :users
    add_index :rounds, :user_id
    change_column_null :rounds, :user_id, false
  end
end
