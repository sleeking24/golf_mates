require "rails_helper"

RSpec.describe "shots#update", type: :request do
  subject(:make_request) do
    jsonapi_put "/api/v1/shots/#{shot.id}", payload
  end

  describe "basic update" do
    let!(:shot) { create(:shot) }

    let(:payload) do
      {
        data: {
          id: shot.id.to_s,
          type: "shots",
          attributes: {
            # ... your attrs here
          },
        },
      }
    end

    # Replace 'xit' with 'it' after adding attributes
    xit "updates the resource" do
      expect(ShotResource).to receive(:find).and_call_original
      expect do
        make_request
        expect(response.status).to eq(200), response.body
      end.to change { shot.reload.attributes }
    end
  end
end
