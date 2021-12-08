require "rails_helper"

RSpec.describe "holes_overviews#destroy", type: :request do
  subject(:make_request) do
    jsonapi_delete "/api/v1/holes_overviews/#{holes_overview.id}"
  end

  describe "basic destroy" do
    let!(:holes_overview) { create(:holes_overview) }

    it "updates the resource" do
      expect(HolesOverviewResource).to receive(:find).and_call_original
      expect do
        make_request
        expect(response.status).to eq(200), response.body
      end.to change { HolesOverview.count }.by(-1)
      expect { holes_overview.reload }.
        to raise_error(ActiveRecord::RecordNotFound)
      expect(json).to eq("meta" => {})
    end
  end
end
