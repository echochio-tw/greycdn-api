import requests
import json

headers = {
    'Content-Type': 'application/x-www-form-urlencoded',
}

data = {
  'username': 'test@gmail.com',
  'password': 'echochio'
}

response = requests.post('https://api.greypanel.com/api/login', headers=headers, data=data)
result = json.loads(response.text)
headers = {
    'Content-Type': 'application/x-www-form-urlencoded',
	'Cookie': 'sid='+result['result'],
}

params = (
    ('keyWord', ''),
    ('page', '1'),
    ('pageSize', '200'),
)

response = requests.get('https://api.greypanel.com/api/site/find-sites',headers=headers, params=params)
result = json.loads(response.text)
for da in result['result']['content']:
    print (da['uniqueName']+' '+da['name'])
