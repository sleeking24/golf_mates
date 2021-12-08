require "rails_helper"

RSpec.describe GolfCourseResource, type: :resource do
  describe "creating" do
    let(:payload) do
      {
        data: {
          type: "golf_courses",
          attributes: {},
        },
      }
    end

    let(:instance) do
      GolfCourseResource.build(payload)
    end

    it "works" do
      expect do
        expect(instance.save).to eq(true),
                                 instance.errors.full_messages.to_sentence
      end.to change { GolfCourse.count }.by(1)
    end
  end

  describe "updating" do
    let!(:golf_course) { create(:golf_course) }

    let(:payload) do
      {
        data: {
          id: golf_course.id.to_s,
          type: "golf_courses",
          attributes: {}, # Todo!
        },
      }
    end

    let(:instance) do
      GolfCourseResource.find(payload)
    end

    xit "works (add some attributes and enable this spec)" do
      expect do
        expect(instance.update_attributes).to eq(true)
      end.to change { golf_course.reload.updated_at }
      # .and change { golf_course.foo }.to('bar') <- example
    end
  end

  describe "destroying" do
    let!(:golf_course) { create(:golf_course) }

    let(:instance) do
      GolfCourseResource.find(id: golf_course.id)
    end

    it "works" do
      expect do
        expect(instance.destroy).to eq(true)
      end.to change { GolfCourse.count }.by(-1)
    end
  end
end
