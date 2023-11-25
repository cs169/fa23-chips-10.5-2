# frozen_string_literal: true

require 'rails_helper'

RSpec.describe LoginController do
  it 'opens login' do
    get :login
    expect(response).to render_template(:login)
  end
end
