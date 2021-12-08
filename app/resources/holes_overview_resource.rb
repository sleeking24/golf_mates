class HolesOverviewResource < ApplicationResource
  attribute :id, :integer, writable: false
  attribute :created_at, :datetime, writable: false
  attribute :updated_at, :datetime, writable: false
  attribute :hole_number, :integer
  attribute :distance_to_hole, :float
  attribute :distance_to_green, :float
  attribute :golf_course_id, :integer

  # Direct associations

  belongs_to :golf_course

  # Indirect associations

end
