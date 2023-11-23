# frozen_string_literal: true

require 'rails_helper'

RSpec.describe NewsItem do
  rep = OpenStruct.new(id: 1234)
  item = OpenStruct.new(representative: rep)

  it 'returns nil if a news item does not exist' do
    allow(described_class).to receive(:find_by).and_return(nil)
    query = described_class.find_for(2)
    expect(query).to be_nil
  end

  it 'finds a news item given a representative' do
    allow(described_class).to receive(:find_by).and_return(item)
    query = described_class.find_for(rep.id)
    expect(query).to eq(item)
  end
end
