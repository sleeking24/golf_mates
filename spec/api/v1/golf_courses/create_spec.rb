require "rails_helper"

RSpec.describe "golf_courses#create", type: :request do
  subject(:make_request) do
    jsonapi_post "/api/v1/golf_courses", payload
  end

  describe "basic create" do
    let(:params) do
      {
        # ... your attrs here
      }
    end
    let(:payload) do
      {
        data: {
          type: "golf_courses",
          attributes: params,
        },
      }
    end

    it "works" do
      expect(GolfCourseResource).to receive(:build).and_call_original
      expect do
        make_request
        expect(response.status).to eq(201), response.body
      end.to change { GolfCourse.count }.by(1)
    end
  end
end
