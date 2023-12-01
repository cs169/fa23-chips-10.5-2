# frozen_string_literal: true

require 'rails_helper'

RSpec.describe Finance, type: :model do
  describe '.get_candidates' do
    it 'returns formatted candidates data' do
      data = {
        'results' => [
          { 'name' => 'RYAN, PAUL D.', 'party' => 'REP', 'state' => '/races/WI.json' }
        ]
      }

      candidates = described_class.get_candidates(data)
      expect(candidates.first).to include({
                                            name:  'PAUL D. RYAN',
                                            party: 'REP',
                                            state: 'WI'
                                          })
    end
  end

  describe '.reformat_name' do
    it 'formats a simple name correctly' do
      expect(described_class.reformat_name('RYAN, PAUL')).to eq('PAUL RYAN')
    end

    it 'formats a joint ticket name correctly' do
      expect(described_class.reformat_name('TRUMP, DONALD J. / MICHAEL R. PENCE')).to eq('DONALD J. TRUMP / MICHAEL R. PENCE')
    end
  end

  describe '.reformat_individual_name' do
    it 'formats an individual name correctly' do
      expect(described_class.reformat_individual_name('RYAN, PAUL')).to eq('PAUL RYAN')
    end
  end
end
