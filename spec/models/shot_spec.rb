require 'rails_helper'

RSpec.describe Shot, type: :model do
  
    describe "Direct Associations" do

    end

    describe "InDirect Associations" do

    end

    describe "Validations" do

    it { should validate_inclusion_of(:shot_type).in_array([ "drive", "chip", "putt" ]) }

    end
end
