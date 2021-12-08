class Round < ApplicationRecord
  # Direct associations

  belongs_to :course,
             :class_name => "GolfCourse"

  belongs_to :user

  # Indirect associations

  # Validations

  # Scopes

  def to_s
    course.to_s
  end

end
