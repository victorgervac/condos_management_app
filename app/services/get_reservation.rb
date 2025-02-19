class GetReservation
  require 'http'
  def initialize(token, token_type)
    @token = token
    @token_type = token_type
  end

  def self.run_this(token, token_type)
    new(token, token_type).all_that
  end

  def all_that
    Rails.cache.fetch(response = HTTP.headers(headers).get(api_url))
    json_data = JSON.parse(response)
    FetchStays.run(json_data: json_data)
  end

  def api_url
    date = Date.today
    "#{Rails.application.credentials.base_url}/reservations?limit=&offset=&order=&channelId=&listingId=&arrivalStartDate=#{date}&arrivalEndDate=&departureStartDate=&departureEndDate=&hasUnreadConversationMessages="
  end

  def headers
    headers = {
      'Authorization': "#{@token_type} #{@token}",
      'Cache-control': 'no-cache}'
    }
  end
end
