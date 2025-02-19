class AuthHostAway
  require 'http'
  def initialize
    @errors = []
  end

  def self.run
    new.post
  end

  def post
    Rails.cache.fetch(response = HTTP.headers(api_headers).post(api_url, form: payload))
    if response.status.success?
      token = JSON.parse(response.body)['access_token']
      token_type = JSON.parse(response.body)['token_type']

      puts "get listings: #{response.status}"
      list_res = GetHostAwayListings.run_this(token, token_type)
      puts "get Reservation: #{response.status}"
      rese_res = GetReservation.run_this(token, token_type)
      puts "lol:#{list_res}#{rese_res}"
    else
      @errors << response
      puts "why error: #{response}"
    end
  end

  private

  def api_url
    "#{Rails.application.credentials.base_url}/accessTokens"
  end

  def payload
    {
      grant_type: 'client_credentials',
      client_id: Rails.application.credentials.hostaway_account_id,
      client_secret: Rails.application.credentials.host_away_api_key,
      scope: 'general'
    }
  end

  def api_headers
    {
      'Content-type': 'application/x-www-form-urlencoded',
      'Cache-Control': 'no-cache'
    }
  end
end
