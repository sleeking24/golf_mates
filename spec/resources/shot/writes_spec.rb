require 'rails_helper'

RSpec.describe ShotResource, type: :resource do
  describe 'creating' do
    let(:payload) do
      {
        data: {
          type: 'shots',
          attributes: { }
        }
      }
    end

    let(:instance) do
      ShotResource.build(payload)
    end

    it 'works' do
      expect {
        expect(instance.save).to eq(true), instance.errors.full_messages.to_sentence
      }.to change { Shot.count }.by(1)
    end
  end

  describe 'updating' do
    let!(:shot) { create(:shot) }

    let(:payload) do
      {
        data: {
          id: shot.id.to_s,
          type: 'shots',
          attributes: { } # Todo!
        }
      }
    end

    let(:instance) do
      ShotResource.find(payload)
    end

    xit 'works (add some attributes and enable this spec)' do
      expect {
        expect(instance.update_attributes).to eq(true)
      }.to change { shot.reload.updated_at }
      # .and change { shot.foo }.to('bar') <- example
    end
  end

  describe 'destroying' do
    let!(:shot) { create(:shot) }

    let(:instance) do
      ShotResource.find(id: shot.id)
    end

    it 'works' do
      expect {
        expect(instance.destroy).to eq(true)
      }.to change { Shot.count }.by(-1)
    end
  end
end
