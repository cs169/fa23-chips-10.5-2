# frozen_string_literal: true

require 'rails_helper'

RSpec.describe User do
  before do
    @google_user = described_class.create(first_name: 'Aadhi', last_name: 'Ghan', provider: 'google_oauth2', uid: '22')
    @github_user = described_class.create(first_name: 'Anvi', last_name: 'Kunta', provider: 'github', uid: '2223')
  end

  it 'name returns first and last name of user' do
    expect(@google_user.name).to eq('Aadhi Ghan')
  end

  it 'returns Google as auth provider' do
    expect(@google_user.auth_provider).to eq('Google')
  end

  it 'returns Github as auth provider' do
    expect(@github_user.auth_provider).to eq('Github')
  end

  it 'finds correct Google User' do
    found = described_class.find_google_user('22')
    expect(found.name).to eq(@google_user.name)
  end

  it 'finds correct Github User' do
    found = described_class.find_github_user('2223')
    expect(found.name).to eq(@github_user.name)
  end
end
