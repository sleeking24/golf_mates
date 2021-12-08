class HolesOverview < ApplicationRecord
  # Direct associations

  belongs_to :golf_course

  # Indirect associations

  # Validations

  validates :hole_number, :numericality => { :less_than_or_equal_to => 18, :greater_than_or_equal_to => 1 }

  # Scopes

  def to_s
    hole_number
  end

end
