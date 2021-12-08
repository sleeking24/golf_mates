require 'rails_helper'

RSpec.describe "shots#index", type: :request do
  let(:params) { {} }

  subject(:make_request) do
    jsonapi_get "/api/v1/shots", params: params
  end

  describe 'basic fetch' do
    let!(:shot1) { create(:shot) }
    let!(:shot2) { create(:shot) }

    it 'works' do
      expect(ShotResource).to receive(:all).and_call_original
      make_request
      expect(response.status).to eq(200), response.body
      expect(d.map(&:jsonapi_type).uniq).to match_array(['shots'])
      expect(d.map(&:id)).to match_array([shot1.id, shot2.id])
    end
  end
end
