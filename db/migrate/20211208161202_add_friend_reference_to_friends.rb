class AddFriendReferenceToFriends < ActiveRecord::Migration[6.0]
  def change
    add_foreign_key :friends, :users, column: :friend_id
    add_index :friends, :friend_id
    change_column_null :friends, :friend_id, false
  end
end
