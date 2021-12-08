require "rails_helper"

RSpec.describe HolesOverviewResource, type: :resource do
  describe "creating" do
    let(:payload) do
      {
        data: {
          type: "holes_overviews",
          attributes: {},
        },
      }
    end

    let(:instance) do
      HolesOverviewResource.build(payload)
    end

    it "works" do
      expect do
        expect(instance.save).to eq(true),
                                 instance.errors.full_messages.to_sentence
      end.to change { HolesOverview.count }.by(1)
    end
  end

  describe "updating" do
    let!(:holes_overview) { create(:holes_overview) }

    let(:payload) do
      {
        data: {
          id: holes_overview.id.to_s,
          type: "holes_overviews",
          attributes: {}, # Todo!
        },
      }
    end

    let(:instance) do
      HolesOverviewResource.find(payload)
    end

    xit "works (add some attributes and enable this spec)" do
      expect do
        expect(instance.update_attributes).to eq(true)
      end.to change { holes_overview.reload.updated_at }
      # .and change { holes_overview.foo }.to('bar') <- example
    end
  end

  describe "destroying" do
    let!(:holes_overview) { create(:holes_overview) }

    let(:instance) do
      HolesOverviewResource.find(id: holes_overview.id)
    end

    it "works" do
      expect do
        expect(instance.destroy).to eq(true)
      end.to change { HolesOverview.count }.by(-1)
    end
  end
end
