class Round < ApplicationRecord
  # Direct associations

  has_many   :holes_results,
             dependent: :destroy

  belongs_to :course,
             class_name: "GolfCourse"

  belongs_to :user

  # Indirect associations

  # Validations

  # Scopes

  def to_s
    course.to_s
  end
end
