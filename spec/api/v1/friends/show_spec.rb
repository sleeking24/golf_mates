require 'rails_helper'

RSpec.describe "friends#show", type: :request do
  let(:params) { {} }

  subject(:make_request) do
    jsonapi_get "/api/v1/friends/#{friend.id}", params: params
  end

  describe 'basic fetch' do
    let!(:friend) { create(:friend) }

    it 'works' do
      expect(FriendResource).to receive(:find).and_call_original
      make_request
      expect(response.status).to eq(200)
      expect(d.jsonapi_type).to eq('friends')
      expect(d.id).to eq(friend.id)
    end
  end
end
