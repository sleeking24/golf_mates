class Shot < ApplicationRecord
  # Direct associations

  # Indirect associations

  # Validations

  validates :shot_type, :inclusion => { :in => [ "drive", "chip", "putt" ]  }

  # Scopes

  def to_s
    shot_distance
  end

end
