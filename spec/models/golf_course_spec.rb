require 'rails_helper'

RSpec.describe GolfCourse, type: :model do
  
    describe "Direct Associations" do

    it { should have_many(:holes_overviews) }

    end

    describe "InDirect Associations" do

    end

    describe "Validations" do

    end
end
