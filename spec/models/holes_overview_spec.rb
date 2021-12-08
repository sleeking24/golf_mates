require "rails_helper"

RSpec.describe HolesOverview, type: :model do
  describe "Direct Associations" do
    it { should belong_to(:golf_course) }
  end

  describe "InDirect Associations" do
  end

  describe "Validations" do
    it {
      should validate_numericality_of(:hole_number).is_less_than(18).is_greater_than_or_equal_to(1)
    }
  end
end
