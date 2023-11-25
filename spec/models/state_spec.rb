# frozen_string_literal: true

require 'rails_helper'

RSpec.describe State do
  it 'returns standardized fibs code with correct number of digits' do
    state = described_class.new(fips_code: 6)
    standardized_fips_score = state.std_fips_code
    expect(standardized_fips_score).to eq('06')
  end
end
