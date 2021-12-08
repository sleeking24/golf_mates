require "rails_helper"

RSpec.describe "holes_results#index", type: :request do
  let(:params) { {} }

  subject(:make_request) do
    jsonapi_get "/api/v1/holes_results", params: params
  end

  describe "basic fetch" do
    let!(:holes_result1) { create(:holes_result) }
    let!(:holes_result2) { create(:holes_result) }

    it "works" do
      expect(HolesResultResource).to receive(:all).and_call_original
      make_request
      expect(response.status).to eq(200), response.body
      expect(d.map(&:jsonapi_type).uniq).to match_array(["holes_results"])
      expect(d.map(&:id)).to match_array([holes_result1.id, holes_result2.id])
    end
  end
end
