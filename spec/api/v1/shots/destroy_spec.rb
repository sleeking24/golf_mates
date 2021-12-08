require "rails_helper"

RSpec.describe "shots#destroy", type: :request do
  subject(:make_request) do
    jsonapi_delete "/api/v1/shots/#{shot.id}"
  end

  describe "basic destroy" do
    let!(:shot) { create(:shot) }

    it "updates the resource" do
      expect(ShotResource).to receive(:find).and_call_original
      expect do
        make_request
        expect(response.status).to eq(200), response.body
      end.to change { Shot.count }.by(-1)
      expect { shot.reload }.
        to raise_error(ActiveRecord::RecordNotFound)
      expect(json).to eq("meta" => {})
    end
  end
end
