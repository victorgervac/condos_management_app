class GetCleaningTasks
  require 'http'

  def initialize(token, token_type)
    @token = token
    @token_type = token_type
  end

  def self.run_this(token, token_type)
    new(token, token_type).all_that
  end

  def all_that
    Rails.cache.fetch(response = HTTP.headers(headers).get(api_url, params: query_string))
    json_data = JSON.parse(response)
    InsertCleaningTaskToDb.run(json_data: json_data)
  end

  def query_string
    querystring = { "limit": '', "offset": '', "sortOrder": '', "city": '', "match": '', "country": '', "contactName": '',
                    "propertyTypeId": '' }
  end

  def api_url
    "#{Rails.application.credentials.base_url}/tasks"
  end

  def headers
    headers = {
      'Authorization': "#{@token_type} #{@token}",
      'Cache-control': 'no-cache}'
    }
  end
end
