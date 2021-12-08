require 'rails_helper'

RSpec.describe "rounds#show", type: :request do
  let(:params) { {} }

  subject(:make_request) do
    jsonapi_get "/api/v1/rounds/#{round.id}", params: params
  end

  describe 'basic fetch' do
    let!(:round) { create(:round) }

    it 'works' do
      expect(RoundResource).to receive(:find).and_call_original
      make_request
      expect(response.status).to eq(200)
      expect(d.jsonapi_type).to eq('rounds')
      expect(d.id).to eq(round.id)
    end
  end
end
