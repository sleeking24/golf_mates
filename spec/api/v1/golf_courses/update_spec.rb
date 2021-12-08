require 'rails_helper'

RSpec.describe "golf_courses#update", type: :request do
  subject(:make_request) do
    jsonapi_put "/api/v1/golf_courses/#{golf_course.id}", payload
  end

  describe 'basic update' do
    let!(:golf_course) { create(:golf_course) }

    let(:payload) do
      {
        data: {
          id: golf_course.id.to_s,
          type: 'golf_courses',
          attributes: {
            # ... your attrs here
          }
        }
      }
    end

    # Replace 'xit' with 'it' after adding attributes
    xit 'updates the resource' do
      expect(GolfCourseResource).to receive(:find).and_call_original
      expect {
        make_request
        expect(response.status).to eq(200), response.body
      }.to change { golf_course.reload.attributes }
    end
  end
end
