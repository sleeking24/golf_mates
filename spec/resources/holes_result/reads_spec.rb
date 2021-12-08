require "rails_helper"

RSpec.describe HolesResultResource, type: :resource do
  describe "serialization" do
    let!(:holes_result) { create(:holes_result) }

    it "works" do
      render
      data = jsonapi_data[0]
      expect(data.id).to eq(holes_result.id)
      expect(data.jsonapi_type).to eq("holes_results")
    end
  end

  describe "filtering" do
    let!(:holes_result1) { create(:holes_result) }
    let!(:holes_result2) { create(:holes_result) }

    context "by id" do
      before do
        params[:filter] = { id: { eq: holes_result2.id } }
      end

      it "works" do
        render
        expect(d.map(&:id)).to eq([holes_result2.id])
      end
    end
  end

  describe "sorting" do
    describe "by id" do
      let!(:holes_result1) { create(:holes_result) }
      let!(:holes_result2) { create(:holes_result) }

      context "when ascending" do
        before do
          params[:sort] = "id"
        end

        it "works" do
          render
          expect(d.map(&:id)).to eq([
                                      holes_result1.id,
                                      holes_result2.id,
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
                                      holes_result2.id,
                                      holes_result1.id,
                                    ])
        end
      end
    end
  end

  describe "sideloading" do
    # ... your tests ...
  end
end
