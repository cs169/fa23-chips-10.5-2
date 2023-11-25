# frozen_string_literal: true

require 'rails_helper'

RSpec.describe County do
  it 'returns standardized fibs code with correct number of digits' do
    county = described_class.new(fips_code: 1)
    expect(county.std_fips_code).to eq('001')
  end
end
