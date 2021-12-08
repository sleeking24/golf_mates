class GolfCourse < ApplicationRecord
  # Direct associations

  has_many   :rounds,
             :foreign_key => "course_id",
             :dependent => :destroy

  has_many   :holes_overviews,
             :dependent => :destroy

  # Indirect associations

  # Validations

  # Scopes

  def to_s
    name
  end

end
