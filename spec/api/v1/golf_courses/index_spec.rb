require 'rails_helper'

RSpec.describe "golf_courses#index", type: :request do
  let(:params) { {} }

  subject(:make_request) do
    jsonapi_get "/api/v1/golf_courses", params: params
  end

  describe 'basic fetch' do
    let!(:golf_course1) { create(:golf_course) }
    let!(:golf_course2) { create(:golf_course) }

    it 'works' do
      expect(GolfCourseResource).to receive(:all).and_call_original
      make_request
      expect(response.status).to eq(200), response.body
      expect(d.map(&:jsonapi_type).uniq).to match_array(['golf_courses'])
      expect(d.map(&:id)).to match_array([golf_course1.id, golf_course2.id])
    end
  end
end
