# frozen_string_literal: true

require 'rails_helper'

describe UserController do
  before do
    @user = User.create(first_name: 'Aadhi', last_name: 'Ghan', provider: 'google_oauth2', uid: '22')
    session[:current_user_id] = @user.id
  end

  it 'test profile' do
    get :profile
    expect(assigns(:user)).to eq(@user)
  end
end
