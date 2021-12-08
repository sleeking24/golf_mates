require 'rails_helper'

RSpec.describe "holes_overviews#index", type: :request do
  let(:params) { {} }

  subject(:make_request) do
    jsonapi_get "/api/v1/holes_overviews", params: params
  end

  describe 'basic fetch' do
    let!(:holes_overview1) { create(:holes_overview) }
    let!(:holes_overview2) { create(:holes_overview) }

    it 'works' do
      expect(HolesOverviewResource).to receive(:all).and_call_original
      make_request
      expect(response.status).to eq(200), response.body
      expect(d.map(&:jsonapi_type).uniq).to match_array(['holes_overviews'])
      expect(d.map(&:id)).to match_array([holes_overview1.id, holes_overview2.id])
    end
  end
end
