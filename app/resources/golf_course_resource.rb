class GolfCourseResource < ApplicationResource
  attribute :id, :integer, writable: false
  attribute :created_at, :datetime, writable: false
  attribute :updated_at, :datetime, writable: false
  attribute :name, :string
  attribute :description, :string
  attribute :location, :string
  attribute :photo, :string

  # Direct associations

  has_many   :rounds,
             foreign_key: :course_id

  has_many   :holes_overviews

  # Indirect associations
end
