class GolfCourse < ApplicationRecord
  # Direct associations

  has_many   :holes_overviews,
             :dependent => :destroy

  # Indirect associations

  # Validations

  # Scopes

  def to_s
    name
  end

end
