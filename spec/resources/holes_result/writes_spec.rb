require 'rails_helper'

RSpec.describe HolesResultResource, type: :resource do
  describe 'creating' do
    let(:payload) do
      {
        data: {
          type: 'holes_results',
          attributes: { }
        }
      }
    end

    let(:instance) do
      HolesResultResource.build(payload)
    end

    it 'works' do
      expect {
        expect(instance.save).to eq(true), instance.errors.full_messages.to_sentence
      }.to change { HolesResult.count }.by(1)
    end
  end

  describe 'updating' do
    let!(:holes_result) { create(:holes_result) }

    let(:payload) do
      {
        data: {
          id: holes_result.id.to_s,
          type: 'holes_results',
          attributes: { } # Todo!
        }
      }
    end

    let(:instance) do
      HolesResultResource.find(payload)
    end

    xit 'works (add some attributes and enable this spec)' do
      expect {
        expect(instance.update_attributes).to eq(true)
      }.to change { holes_result.reload.updated_at }
      # .and change { holes_result.foo }.to('bar') <- example
    end
  end

  describe 'destroying' do
    let!(:holes_result) { create(:holes_result) }

    let(:instance) do
      HolesResultResource.find(id: holes_result.id)
    end

    it 'works' do
      expect {
        expect(instance.destroy).to eq(true)
      }.to change { HolesResult.count }.by(-1)
    end
  end
end
