# frozen_string_literal: true

require 'rails_helper'

RSpec.describe EventsController do
  it 'displays everything without filter' do
    get :index
    expect(response).to render_template(:index)
  end
end
