# frozen_string_literal: true

class FinancesController < ApplicationController
  def search; end

  def search_finance
    cycle = params[:cycle]
    category = params[:category]
    api_url = "https://api.propublica.org/campaign-finance/v1/#{cycle}/candidates/leaders/#{category}.json"
    uri = URI(api_url)
    request = Net::HTTP::Get.new(uri)
    request['X-API-Key'] = Rails.application.credentials[:PROPUBLICA_API_KEY]
    response = Net::HTTP.start(uri.hostname, uri.port, use_ssl: uri.scheme == 'https') do |http|
      http.request(request)
    end
    if response.is_a?(Net::HTTPSuccess)
      data = JSON.parse(response.body)
      @candidates = Finance.get_candidates(data)
      Rails.logger.debug @candidates
    end
    render 'finances/show'
  end
end
