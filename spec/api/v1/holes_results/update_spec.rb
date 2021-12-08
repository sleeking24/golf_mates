require 'rails_helper'

RSpec.describe "holes_results#update", type: :request do
  subject(:make_request) do
    jsonapi_put "/api/v1/holes_results/#{holes_result.id}", payload
  end

  describe 'basic update' do
    let!(:holes_result) { create(:holes_result) }

    let(:payload) do
      {
        data: {
          id: holes_result.id.to_s,
          type: 'holes_results',
          attributes: {
            # ... your attrs here
          }
        }
      }
    end

    # Replace 'xit' with 'it' after adding attributes
    xit 'updates the resource' do
      expect(HolesResultResource).to receive(:find).and_call_original
      expect {
        make_request
        expect(response.status).to eq(200), response.body
      }.to change { holes_result.reload.attributes }
    end
  end
end
