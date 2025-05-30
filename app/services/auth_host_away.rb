class AuthHostAway
  require 'http'
  def initialize(fetch_type)
    @fetch_type = fetch_type[:data_type]
    @errors = []
  end

  def self.run(fetch_type)
    new(fetch_type).post
  end

  def post
    Rails.cache.fetch(response = HTTP.headers(api_headers).post(api_url, form: payload))
    if response.status.success?
      token = JSON.parse(response.body)['access_token']
      token_type = JSON.parse(response.body)['token_type']
      puts "Auth:#{response.status}"
      list_res = GetHostAwayListings.run_this(token, token_type) if @fetch_type == 'listings'
      puts "GetHostAwayListings: #{list_res}" if @fetch_type == 'listings'
      rese_res = GetReservation.run_this(token, token_type) if @fetch_type == 'listings'
      puts "GetReservation:#{rese_res}" if @fetch_type == 'listings'
      clean_res = GetCleaningTasks.run_this(token, token_type) if @fetch_type == 'cleanings'
      puts "GetCleaningTasks:#{clean_res}" if @fetch_type == 'cleanings'
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
