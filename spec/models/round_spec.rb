require "rails_helper"

RSpec.describe Round, type: :model do
  describe "Direct Associations" do
    it { should have_many(:holes_results) }

    it { should belong_to(:course) }

    it { should belong_to(:user) }
  end

  describe "InDirect Associations" do
  end

  describe "Validations" do
  end
end
