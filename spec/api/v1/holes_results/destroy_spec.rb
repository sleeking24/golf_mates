require 'rails_helper'

RSpec.describe "holes_results#destroy", type: :request do
  subject(:make_request) do
    jsonapi_delete "/api/v1/holes_results/#{holes_result.id}"
  end

  describe 'basic destroy' do
    let!(:holes_result) { create(:holes_result) }

    it 'updates the resource' do
      expect(HolesResultResource).to receive(:find).and_call_original
      expect {
        make_request
        expect(response.status).to eq(200), response.body
      }.to change { HolesResult.count }.by(-1)
      expect { holes_result.reload }
        .to raise_error(ActiveRecord::RecordNotFound)
      expect(json).to eq('meta' => {})
    end
  end
end
