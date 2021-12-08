require "rails_helper"

RSpec.describe HolesResult, type: :model do
  describe "Direct Associations" do
    it { should have_many(:shots) }

    it { should belong_to(:round) }
  end

  describe "InDirect Associations" do
  end

  describe "Validations" do
    it {
      should validate_inclusion_of(:hole_number).in_array(["1", "2", "3", "4", "5",
                                                           "6", "7", "8", "9", "10", "11", "12", "13", "14", "15", "16", "17", "18"])
    }
  end
end
