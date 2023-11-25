# frozen_string_literal: true

require 'rails_helper'

RSpec.describe NewsItem do
  item = OpenStruct.new(representative: OpenStruct.new(id: 1234))

  it 'returns nil if a news item does not exist' do
    allow(described_class).to receive(:find_by).and_return(nil)
    query = described_class.find_for(0)
    expect(query).to be_nil
  end

  it 'finds a news item given a representative' do
    allow(described_class).to receive(:find_by).and_return(item)
    query = described_class.find_for(1234)
    expect(query).to eq(item)
  end
end
