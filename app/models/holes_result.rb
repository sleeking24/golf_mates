class HolesResult < ApplicationRecord
  # Direct associations

  # Indirect associations

  # Validations

  validates :hole_number, :inclusion => { :in => [ "1", "2", "3", "4", "5", "6", "7", "8", "9", "10", "11", "12", "13", "14", "15", "16", "17", "18" ]  }

  # Scopes

  def to_s
    round.to_s
  end

end
