# frozen_string_literal: true

class FinancesController < ApplicationController
  def search; end
  def search_finance
    puts "Made it here"
    cycle = params[:cycle]
    category = params[:category]
    puts "Here are the cycle & category: #{cycle} #{category}"
    #add some error checking?
    api_url = "https://api.propublica.org/campaign-finance/v1/#{cycle}/candidates/leaders/#{category}.json"
    uri = URI(api_url)
    puts "OOOOOOOOOOOOOO ANTAVA MAVA API URL: #{api_url}"
    # Create a new HTTP request
    request = Net::HTTP::Get.new(uri)
    request['X-API-Key'] =  Rails.application.credentials[:PROPUBLICA_API_KEY]
    # Use Net::HTTP to send the request
    response = Net::HTTP.start(uri.hostname, uri.port, use_ssl: uri.scheme == 'https') do |http|
      http.request(request)
    end
    if response.is_a?(Net::HTTPSuccess)
      data = JSON.parse(response.body)
      @candidates = Finance.get_candidates(data)
      puts @candidates
    else
      puts "We ran into an error"
    end
    # Parse the JSON response
    #passes candidates to the view
    #and then use the view to output to the screen
    render 'finances/show'
  end
end
