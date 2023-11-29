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

RSpec.describe NewsItem do
  let(:representative) {Representative.create(id: 100)}
  before do
    representative.save!
  end
  
  it 'is valid with a valid issue' do 
    news_item = NewsItem.new(title: "Test Article", link: "https://www.google.com", representative_id: 100, issue: 2)
    expect(news_item).to be_valid
  end

  it 'raises an ArgumentError with an invalid issue' do 
    expect {
      NewsItem.new(title: "Test Article", link: "https://www.google.com", representative_id: 100, issue: 102)
    }.to raise_error(ArgumentError, "'102' is not a valid issue")
  end
end
