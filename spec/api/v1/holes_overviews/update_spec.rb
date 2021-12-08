require 'rails_helper'

RSpec.describe "holes_overviews#update", type: :request do
  subject(:make_request) do
    jsonapi_put "/api/v1/holes_overviews/#{holes_overview.id}", payload
  end

  describe 'basic update' do
    let!(:holes_overview) { create(:holes_overview) }

    let(:payload) do
      {
        data: {
          id: holes_overview.id.to_s,
          type: 'holes_overviews',
          attributes: {
            # ... your attrs here
          }
        }
      }
    end

    # Replace 'xit' with 'it' after adding attributes
    xit 'updates the resource' do
      expect(HolesOverviewResource).to receive(:find).and_call_original
      expect {
        make_request
        expect(response.status).to eq(200), response.body
      }.to change { holes_overview.reload.attributes }
    end
  end
end
