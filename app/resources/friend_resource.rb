class FriendResource < ApplicationResource
  attribute :id, :integer, writable: false
  attribute :created_at, :datetime, writable: false
  attribute :updated_at, :datetime, writable: false
  attribute :friend_id, :integer

  # Direct associations

  belongs_to :friend,
             resource: UserResource

  # Indirect associations
end
