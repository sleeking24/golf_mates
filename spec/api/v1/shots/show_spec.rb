require 'rails_helper'

RSpec.describe "shots#show", type: :request do
  let(:params) { {} }

  subject(:make_request) do
    jsonapi_get "/api/v1/shots/#{shot.id}", params: params
  end

  describe 'basic fetch' do
    let!(:shot) { create(:shot) }

    it 'works' do
      expect(ShotResource).to receive(:find).and_call_original
      make_request
      expect(response.status).to eq(200)
      expect(d.jsonapi_type).to eq('shots')
      expect(d.id).to eq(shot.id)
    end
  end
end
