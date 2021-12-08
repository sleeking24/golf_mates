require 'rails_helper'

RSpec.describe "rounds#update", type: :request do
  subject(:make_request) do
    jsonapi_put "/api/v1/rounds/#{round.id}", payload
  end

  describe 'basic update' do
    let!(:round) { create(:round) }

    let(:payload) do
      {
        data: {
          id: round.id.to_s,
          type: 'rounds',
          attributes: {
            # ... your attrs here
          }
        }
      }
    end

    # Replace 'xit' with 'it' after adding attributes
    xit 'updates the resource' do
      expect(RoundResource).to receive(:find).and_call_original
      expect {
        make_request
        expect(response.status).to eq(200), response.body
      }.to change { round.reload.attributes }
    end
  end
end
