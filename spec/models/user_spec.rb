# frozen_string_literal: true

require 'rails_helper'

RSpec.describe User do
  it 'name returns first and last name of user' do
    user = described_class.new(first_name: 'Aadhiti', last_name: 'Ghankota')
    name = user.name
    expect(name).to eq('Aadhiti Ghankota')
  end

  it 'returns Google as auth provider' do
    user = described_class.new(first_name: 'Aadhiti', last_name: 'Ghankota', provider: 'google_oauth2')
    auth = user.auth_provider
    expect(auth).to eq('Google')
  end

  it 'returns Github as auth provider' do
    user = described_class.new(first_name: 'Aadhiti', last_name: 'Ghankota', provider: 'github')
    auth = user.auth_provider
    expect(auth).to eq('Github')
  end

  it 'finds correct Google User' do
    user = described_class.create(first_name: 'Aadhiti', last_name: 'Ghankota', provider: 'google_oauth2', uid: '2222')
    found = described_class.find_google_user('2222')
    expect(found.name).to eq(user.name)
  end

  it 'finds correct Github User' do
    user = described_class.create(first_name: 'Aadhiti', last_name: 'Ghankota', provider: 'github', uid: '2222')
    found = described_class.find_github_user('2222')
    expect(found.name).to eq(user.name)
  end
end
