require "rails_helper"

RSpec.describe "golf_courses#destroy", type: :request do
  subject(:make_request) do
    jsonapi_delete "/api/v1/golf_courses/#{golf_course.id}"
  end

  describe "basic destroy" do
    let!(:golf_course) { create(:golf_course) }

    it "updates the resource" do
      expect(GolfCourseResource).to receive(:find).and_call_original
      expect do
        make_request
        expect(response.status).to eq(200), response.body
      end.to change { GolfCourse.count }.by(-1)
      expect { golf_course.reload }.
        to raise_error(ActiveRecord::RecordNotFound)
      expect(json).to eq("meta" => {})
    end
  end
end
