# frozen_string_literal: true

require 'rails_helper'

RSpec.describe MyEventsController do
  it 'does new' do
    get :new
    expect(response).to redirect_to(login_path)
  end

  it 'does not create' do
    post :create
    expect(response).to redirect_to(login_path)
  end
end
