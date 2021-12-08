require "rails_helper"

RSpec.describe FriendResource, type: :resource do
  describe "creating" do
    let(:payload) do
      {
        data: {
          type: "friends",
          attributes: {},
        },
      }
    end

    let(:instance) do
      FriendResource.build(payload)
    end

    it "works" do
      expect do
        expect(instance.save).to eq(true),
                                 instance.errors.full_messages.to_sentence
      end.to change { Friend.count }.by(1)
    end
  end

  describe "updating" do
    let!(:friend) { create(:friend) }

    let(:payload) do
      {
        data: {
          id: friend.id.to_s,
          type: "friends",
          attributes: {}, # Todo!
        },
      }
    end

    let(:instance) do
      FriendResource.find(payload)
    end

    xit "works (add some attributes and enable this spec)" do
      expect do
        expect(instance.update_attributes).to eq(true)
      end.to change { friend.reload.updated_at }
      # .and change { friend.foo }.to('bar') <- example
    end
  end

  describe "destroying" do
    let!(:friend) { create(:friend) }

    let(:instance) do
      FriendResource.find(id: friend.id)
    end

    it "works" do
      expect do
        expect(instance.destroy).to eq(true)
      end.to change { Friend.count }.by(-1)
    end
  end
end
