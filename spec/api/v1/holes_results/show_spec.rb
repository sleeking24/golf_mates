require 'rails_helper'

RSpec.describe "holes_results#show", type: :request do
  let(:params) { {} }

  subject(:make_request) do
    jsonapi_get "/api/v1/holes_results/#{holes_result.id}", params: params
  end

  describe 'basic fetch' do
    let!(:holes_result) { create(:holes_result) }

    it 'works' do
      expect(HolesResultResource).to receive(:find).and_call_original
      make_request
      expect(response.status).to eq(200)
      expect(d.jsonapi_type).to eq('holes_results')
      expect(d.id).to eq(holes_result.id)
    end
  end
end
