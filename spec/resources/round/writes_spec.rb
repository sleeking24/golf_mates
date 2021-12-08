require 'rails_helper'

RSpec.describe RoundResource, type: :resource do
  describe 'creating' do
    let(:payload) do
      {
        data: {
          type: 'rounds',
          attributes: { }
        }
      }
    end

    let(:instance) do
      RoundResource.build(payload)
    end

    it 'works' do
      expect {
        expect(instance.save).to eq(true), instance.errors.full_messages.to_sentence
      }.to change { Round.count }.by(1)
    end
  end

  describe 'updating' do
    let!(:round) { create(:round) }

    let(:payload) do
      {
        data: {
          id: round.id.to_s,
          type: 'rounds',
          attributes: { } # Todo!
        }
      }
    end

    let(:instance) do
      RoundResource.find(payload)
    end

    xit 'works (add some attributes and enable this spec)' do
      expect {
        expect(instance.update_attributes).to eq(true)
      }.to change { round.reload.updated_at }
      # .and change { round.foo }.to('bar') <- example
    end
  end

  describe 'destroying' do
    let!(:round) { create(:round) }

    let(:instance) do
      RoundResource.find(id: round.id)
    end

    it 'works' do
      expect {
        expect(instance.destroy).to eq(true)
      }.to change { Round.count }.by(-1)
    end
  end
end
