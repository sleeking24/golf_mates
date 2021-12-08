class RoundResource < ApplicationResource
  attribute :id, :integer, writable: false
  attribute :created_at, :datetime, writable: false
  attribute :updated_at, :datetime, writable: false
  attribute :course_id, :integer
  attribute :user_id, :integer
  attribute :score, :integer
  attribute :best_hole, :integer
  attribute :worst_hole, :integer
  attribute :reason_wonlost, :string
  attribute :best_hole_description, :string
  attribute :worst_hole_description, :string

  # Direct associations

  # Indirect associations

end
