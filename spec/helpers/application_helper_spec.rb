# frozen_string_literal: true

RSpec.describe ApplicationHelper do
  input = [OpenStruct.new(name: 'California', id: 'CA', symbol: 'CA')]
  input += [OpenStruct.new(name: 'Washington', id: 'WA', symbol: 'WA')]
  input += [OpenStruct.new(name: 'Oregon', id: 'OR', symbol: 'OR')]
  expected = { 'California' => 'CA', 'Washington' => 'WA', 'Oregon' => 'OR' }

  before do
    allow(State).to receive(:all).and_return(input)
  end

  it 'creates state id hash' do
    h = described_class.state_ids_by_name
    expect(h).to eq(expected)
  end

  it 'creates state symbols hash' do
    h = described_class.state_symbols_by_name
    expect(h).to eq(expected)
  end
end
