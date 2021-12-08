require "rails_helper"

RSpec.describe FriendResource, type: :resource do
  describe "serialization" do
    let!(:friend) { create(:friend) }

    it "works" do
      render
      data = jsonapi_data[0]
      expect(data.id).to eq(friend.id)
      expect(data.jsonapi_type).to eq("friends")
    end
  end

  describe "filtering" do
    let!(:friend1) { create(:friend) }
    let!(:friend2) { create(:friend) }

    context "by id" do
      before do
        params[:filter] = { id: { eq: friend2.id } }
      end

      it "works" do
        render
        expect(d.map(&:id)).to eq([friend2.id])
      end
    end
  end

  describe "sorting" do
    describe "by id" do
      let!(:friend1) { create(:friend) }
      let!(:friend2) { create(:friend) }

      context "when ascending" do
        before do
          params[:sort] = "id"
        end

        it "works" do
          render
          expect(d.map(&:id)).to eq([
                                      friend1.id,
                                      friend2.id,
                                    ])
        end
      end

      context "when descending" do
        before do
          params[:sort] = "-id"
        end

        it "works" do
          render
          expect(d.map(&:id)).to eq([
                                      friend2.id,
                                      friend1.id,
                                    ])
        end
      end
    end
  end

  describe "sideloading" do
    # ... your tests ...
  end
end
