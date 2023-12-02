# frozen_string_literal: true
class FinancesController < ApplicationController
  MAX_RETRIES = 3

  def search_finance
    cycle = params[:cycle]
    category = params[:category]
    response = make_api_request(cycle, category)
    process_response(response)
  rescue => e
    handle_error(e)
  end

  private

  def make_api_request(cycle, category)
    api_url = "https://api.propublica.org/campaign-finance/v1/#{cycle}/candidates/leaders/#{category}.json"
    uri = URI(api_url)
    request = Net::HTTP::Get.new(uri)
    request['X-API-Key'] = Rails.application.credentials[:PROPUBLICA_API_KEY]
    Net::HTTP.start(uri.hostname, uri.port, use_ssl: uri.scheme == 'https', read_timeout: 120) do |http|
      http.request(request)
    end
  end

  def process_response(response)
    raise "Request failed with response code #{response.code}" unless response.is_a?(Net::HTTPSuccess)
    data = JSON.parse(response.body)
    @candidates = Finance.get_candidates(data)
    render 'finances/show'
  end

  def handle_error(error, attempts = 0)
    if attempts < MAX_RETRIES
      sleep(2**attempts)
      search_finance
    else
      render plain: "API request failed after several attempts: #{error.message}", status: :service_unavailable
    end
  end
end
