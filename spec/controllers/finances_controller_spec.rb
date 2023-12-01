# frozen_string_literal: true

require 'rails_helper'

RSpec.describe FinancesController, type: :controller do
  describe 'GET #search' do
    it 'renders the search template' do
      get :search
      expect(response).to render_template(:search)
    end
  end

  describe 'POST #search_finance' do
    context 'with valid parameters' do
      let(:fake_api_response) do
        {
          'results' => [
            { 'name' => 'RYAN, PAUL D.', 'party' => 'REP', 'state' => 'WI' }
          ]
        }.to_json
      end

      before do
        response_double = instance_double(Net::HTTPSuccess, body: fake_api_response)
        allow(Net::HTTP).to receive(:start).and_return(response_double)
      end

      it 'renders the show template' do
        post :search_finance, params: { cycle: '2022', category: 'senate' }
        expect(response).to render_template(:show)
      end
    end
  end
end
