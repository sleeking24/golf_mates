require "rails_helper"

RSpec.describe "friends#destroy", type: :request do
  subject(:make_request) do
    jsonapi_delete "/api/v1/friends/#{friend.id}"
  end

  describe "basic destroy" do
    let!(:friend) { create(:friend) }

    it "updates the resource" do
      expect(FriendResource).to receive(:find).and_call_original
      expect do
        make_request
        expect(response.status).to eq(200), response.body
      end.to change { Friend.count }.by(-1)
      expect { friend.reload }.
        to raise_error(ActiveRecord::RecordNotFound)
      expect(json).to eq("meta" => {})
    end
  end
end
