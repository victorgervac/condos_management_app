class CleaningTasks
  import requests

  url = 'https://api.hostaway.com/v1/tasks'

  headers = {
    'Authorization': "Bearer": 'no-cache'
  }

  response = requests.request('GET', url, headers = headers)

  print(response.text)
end
