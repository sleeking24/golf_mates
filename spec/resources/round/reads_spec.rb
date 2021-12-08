require 'rails_helper'

RSpec.describe RoundResource, type: :resource do
  describe 'serialization' do
    let!(:round) { create(:round) }

    it 'works' do
      render
      data = jsonapi_data[0]
      expect(data.id).to eq(round.id)
      expect(data.jsonapi_type).to eq('rounds')
    end
  end

  describe 'filtering' do
    let!(:round1) { create(:round) }
    let!(:round2) { create(:round) }

    context 'by id' do
      before do
        params[:filter] = { id: { eq: round2.id } }
      end

      it 'works' do
        render
        expect(d.map(&:id)).to eq([round2.id])
      end
    end
  end

  describe 'sorting' do
    describe 'by id' do
      let!(:round1) { create(:round) }
      let!(:round2) { create(:round) }

      context 'when ascending' do
        before do
          params[:sort] = 'id'
        end

        it 'works' do
          render
          expect(d.map(&:id)).to eq([
            round1.id,
            round2.id
          ])
        end
      end

      context 'when descending' do
        before do
          params[:sort] = '-id'
        end

        it 'works' do
          render
          expect(d.map(&:id)).to eq([
            round2.id,
            round1.id
          ])
        end
      end
    end
  end

  describe 'sideloading' do
    # ... your tests ...
  end
end
