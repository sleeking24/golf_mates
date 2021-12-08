require "rails_helper"

RSpec.describe GolfCourseResource, type: :resource do
  describe "serialization" do
    let!(:golf_course) { create(:golf_course) }

    it "works" do
      render
      data = jsonapi_data[0]
      expect(data.id).to eq(golf_course.id)
      expect(data.jsonapi_type).to eq("golf_courses")
    end
  end

  describe "filtering" do
    let!(:golf_course1) { create(:golf_course) }
    let!(:golf_course2) { create(:golf_course) }

    context "by id" do
      before do
        params[:filter] = { id: { eq: golf_course2.id } }
      end

      it "works" do
        render
        expect(d.map(&:id)).to eq([golf_course2.id])
      end
    end
  end

  describe "sorting" do
    describe "by id" do
      let!(:golf_course1) { create(:golf_course) }
      let!(:golf_course2) { create(:golf_course) }

      context "when ascending" do
        before do
          params[:sort] = "id"
        end

        it "works" do
          render
          expect(d.map(&:id)).to eq([
                                      golf_course1.id,
                                      golf_course2.id,
                                    ])
        end
      end

      context "when descending" do
        before do
          params[:sort] = "-id"
        end

        it "works" do
          render
          expect(d.map(&:id)).to eq([
                                      golf_course2.id,
                                      golf_course1.id,
                                    ])
        end
      end
    end
  end

  describe "sideloading" do
    # ... your tests ...
  end
end
