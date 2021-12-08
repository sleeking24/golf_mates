class HolesResultResource < ApplicationResource
  attribute :id, :integer, writable: false
  attribute :created_at, :datetime, writable: false
  attribute :updated_at, :datetime, writable: false
  attribute :round_id, :integer
  attribute :hole_number, :integer
  attribute :number_of_strokes, :integer

  # Direct associations

  has_many   :shots,
             foreign_key: :hole_id

  belongs_to :round

  # Indirect associations

end
