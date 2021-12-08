require 'rails_helper'

RSpec.describe "friends#index", type: :request do
  let(:params) { {} }

  subject(:make_request) do
    jsonapi_get "/api/v1/friends", params: params
  end

  describe 'basic fetch' do
    let!(:friend1) { create(:friend) }
    let!(:friend2) { create(:friend) }

    it 'works' do
      expect(FriendResource).to receive(:all).and_call_original
      make_request
      expect(response.status).to eq(200), response.body
      expect(d.map(&:jsonapi_type).uniq).to match_array(['friends'])
      expect(d.map(&:id)).to match_array([friend1.id, friend2.id])
    end
  end
end
