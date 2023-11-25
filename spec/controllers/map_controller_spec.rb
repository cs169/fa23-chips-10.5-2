# frozen_string_literal: true

require 'rails_helper'

describe MapController do
  it 'redirects to root_path if state does not exist' do
    get :state, params: { state_symbol: 'fake' }
    expect(response).to redirect_to(root_path)
  end
end
