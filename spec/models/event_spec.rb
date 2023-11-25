# frozen_string_literal: true

require 'rails_helper'

RSpec.describe Event do
  it 'invalid without start time' do
    event = described_class.new(start_time: nil)
    expect(event).not_to be_valid
  end
end
