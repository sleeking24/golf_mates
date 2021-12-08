require 'rails_helper'

RSpec.describe "rounds#index", type: :request do
  let(:params) { {} }

  subject(:make_request) do
    jsonapi_get "/api/v1/rounds", params: params
  end

  describe 'basic fetch' do
    let!(:round1) { create(:round) }
    let!(:round2) { create(:round) }

    it 'works' do
      expect(RoundResource).to receive(:all).and_call_original
      make_request
      expect(response.status).to eq(200), response.body
      expect(d.map(&:jsonapi_type).uniq).to match_array(['rounds'])
      expect(d.map(&:id)).to match_array([round1.id, round2.id])
    end
  end
end
