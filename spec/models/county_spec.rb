# frozen_string_literal: true

require 'rails_helper'

RSpec.describe County do
  it 'returns standardized fibs code with correct number of digits' do
    county = described_class.new(fips_code: 1)
    standardized_fips_score = county.std_fips_code
    expect(standardized_fips_score).to eq('001')
  end
end
