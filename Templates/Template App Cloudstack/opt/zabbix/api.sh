#!/bin/bash

#	https://mail-archives.apache.org/mod_mbox/incubator-cloudstack-dev/201301.mbox/%3C67EF18FDCA335F489B366120481AB6C5F6BC7C7ADB@BANPMAILBOX01.citrite.net%3E
#	You can use the cloudstack UI to generate them . This is what you need to do - 

#	To generate API Key and Secret Key

#	1.Login as admin
#	2.Go to Accounts
#	3.Select the account which user belongs
#	4.Click on view users
#	5.Select the user
#	6.Click on generate keys icon and you'll be able to see them in the detail View. 

#	Or you could also use the API ( registerUserKeys) directly as per your convenience.

#	https://docs.cloudstack.apache.org/en/latest/dev.html



url=$1

url="https://localhost/client/api?apikey=##API-KEY##&command=listHosts&response=json&signature=##SIGNATUR##"


echo curl -s -k "$url"


