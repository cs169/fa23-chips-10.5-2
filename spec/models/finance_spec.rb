# frozen_string_literal: true

require 'rails_helper'

RSpec.describe Finance, type: :model do
  describe '.get_candidates' do
    context 'with valid data' do
      subject { described_class.get_candidates(data).first }

      let(:data) do
        {
          'results' => [
            { 'name' => 'RYAN, PAUL D.', 'party' => 'REP', 'state' => '/races/WI.json' }
          ]
        }
      end

      it { is_expected.to eq(name: 'PAUL D. RYAN', party: 'REP', state: 'WI') }
    end

    it 'handles nil data' do
      candidates = described_class.get_candidates(nil)
      expect(candidates).to eq([])
    end

    it 'handles empty data' do
      data = { 'results' => [] }

      candidates = described_class.get_candidates(data)
      expect(candidates).to eq([])
    end

    it 'handles invalid data structure' do
      data = { 'results' => 'not an array' }

      candidates = described_class.get_candidates(data)
      expect(candidates).to eq([])
    end
  end

  describe '.reformat_name' do
    it 'formats a simple name correctly' do
      expect(described_class.reformat_name('RYAN, PAUL')).to eq('PAUL RYAN')
    end

    it 'formats a joint ticket name correctly' do
      expected_name = 'DONALD J. TRUMP / MICHAEL R. PENCE'
      input_name = 'TRUMP, DONALD J. / MICHAEL R. PENCE'

      expect(described_class.reformat_name(input_name)).to eq(expected_name)
    end
  end

  describe '.reformat_individual_name' do
    it 'formats an individual name correctly' do
      expect(described_class.reformat_individual_name('RYAN, PAUL')).to eq('PAUL RYAN')
    end

    it 'handles names with multiple spaces correctly' do
      expect(described_class.reformat_individual_name('   RYAN,    PAUL   ')).to eq('PAUL RYAN')
    end
  end
end
