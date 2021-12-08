class Friend < ApplicationRecord
  # Direct associations

  belongs_to :friend,
             class_name: "User"

  # Indirect associations

  # Validations

  # Scopes

  def to_s
    friend.to_s
  end
end
