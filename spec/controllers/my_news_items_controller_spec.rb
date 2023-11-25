# frozen_string_literal: true

require 'rails_helper'

RSpec.describe MyNewsItemsController do
  it 'directs to new' do
    get :new, params: { representative_id: '1234' }
    expect(response).to redirect_to(login_path)
  end
end
