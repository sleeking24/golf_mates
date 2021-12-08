require 'rails_helper'

RSpec.describe "holes_overviews#create", type: :request do
  subject(:make_request) do
    jsonapi_post "/api/v1/holes_overviews", payload
  end

  describe 'basic create' do
    let(:params) do
      {
        # ... your attrs here
      }
    end
    let(:payload) do
      {
        data: {
          type: 'holes_overviews',
          attributes: params
        }
      }
    end

    it 'works' do
      expect(HolesOverviewResource).to receive(:build).and_call_original
      expect {
        make_request
        expect(response.status).to eq(201), response.body
      }.to change { HolesOverview.count }.by(1)
    end
  end
end