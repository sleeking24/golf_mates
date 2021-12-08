require 'rails_helper'

RSpec.describe "holes_overviews#show", type: :request do
  let(:params) { {} }

  subject(:make_request) do
    jsonapi_get "/api/v1/holes_overviews/#{holes_overview.id}", params: params
  end

  describe 'basic fetch' do
    let!(:holes_overview) { create(:holes_overview) }

    it 'works' do
      expect(HolesOverviewResource).to receive(:find).and_call_original
      make_request
      expect(response.status).to eq(200)
      expect(d.jsonapi_type).to eq('holes_overviews')
      expect(d.id).to eq(holes_overview.id)
    end
  end
end
