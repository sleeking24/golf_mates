class Shot < ApplicationRecord
  # Direct associations

  # Indirect associations

  # Validations

  validates :shot_results, :inclusion => { :in => [ "on green", "in rough", "out of bounds", "on fairway", "in hole" ]  }

  validates :shot_type, :inclusion => { :in => [ "drive", "chip", "putt" ]  }

  # Scopes

  def to_s
    shot_distance
  end

end
