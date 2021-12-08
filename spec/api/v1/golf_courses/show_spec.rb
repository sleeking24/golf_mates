require "rails_helper"

RSpec.describe "golf_courses#show", type: :request do
  let(:params) { {} }

  subject(:make_request) do
    jsonapi_get "/api/v1/golf_courses/#{golf_course.id}", params: params
  end

  describe "basic fetch" do
    let!(:golf_course) { create(:golf_course) }

    it "works" do
      expect(GolfCourseResource).to receive(:find).and_call_original
      make_request
      expect(response.status).to eq(200)
      expect(d.jsonapi_type).to eq("golf_courses")
      expect(d.id).to eq(golf_course.id)
    end
  end
end
