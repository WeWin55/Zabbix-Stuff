#!/usr/bin/python
import requests
import json
 
url = "https://localhost/client/api?apikey=##API-Key##&command=listHosts&response=json&signature=##SIGNATUR##"
r = requests.get(url, verify=False)
json_data = r.text
data = json.loads(json_data)
new_data = {}
new_data['data'] = []

for blub in  data['listhostsresponse']['host']:
    temp_name = {}
    temp_name['{#PLNAME}'] =  blub['name']
    new_data['data'].append(temp_name)

print(json.dumps(new_data))

