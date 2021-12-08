require "rails_helper"

RSpec.describe "friends#update", type: :request do
  subject(:make_request) do
    jsonapi_put "/api/v1/friends/#{friend.id}", payload
  end

  describe "basic update" do
    let!(:friend) { create(:friend) }

    let(:payload) do
      {
        data: {
          id: friend.id.to_s,
          type: "friends",
          attributes: {
            # ... your attrs here
          },
        },
      }
    end

    # Replace 'xit' with 'it' after adding attributes
    xit "updates the resource" do
      expect(FriendResource).to receive(:find).and_call_original
      expect do
        make_request
        expect(response.status).to eq(200), response.body
      end.to change { friend.reload.attributes }
    end
  end
end
