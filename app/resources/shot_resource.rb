class ShotResource < ApplicationResource
  attribute :id, :integer, writable: false
  attribute :created_at, :datetime, writable: false
  attribute :updated_at, :datetime, writable: false
  attribute :shot_distance, :float
  attribute :shot_results, :string
  attribute :distance_to_green, :float
  attribute :shot_type, :string
  attribute :hole_id, :integer

  # Direct associations

  belongs_to :hole,
             resource: HolesResultResource

  # Indirect associations

end
