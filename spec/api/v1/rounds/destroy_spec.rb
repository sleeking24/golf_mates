require "rails_helper"

RSpec.describe "rounds#destroy", type: :request do
  subject(:make_request) do
    jsonapi_delete "/api/v1/rounds/#{round.id}"
  end

  describe "basic destroy" do
    let!(:round) { create(:round) }

    it "updates the resource" do
      expect(RoundResource).to receive(:find).and_call_original
      expect do
        make_request
        expect(response.status).to eq(200), response.body
      end.to change { Round.count }.by(-1)
      expect { round.reload }.
        to raise_error(ActiveRecord::RecordNotFound)
      expect(json).to eq("meta" => {})
    end
  end
end
