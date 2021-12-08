require 'rails_helper'

RSpec.describe "holes_results#create", type: :request do
  subject(:make_request) do
    jsonapi_post "/api/v1/holes_results", payload
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
          type: 'holes_results',
          attributes: params
        }
      }
    end

    it 'works' do
      expect(HolesResultResource).to receive(:build).and_call_original
      expect {
        make_request
        expect(response.status).to eq(201), response.body
      }.to change { HolesResult.count }.by(1)
    end
  end
end
