#!/bin/bash

# Area_Mode

# OK = 200
status=$(curl -s -o /dev/null -I -w "%{http_code}" http://USER:PW@10.10.10.184/action/panelCondGet)

if [ $status -eq "200" ]
then
#	echo "Successfully connected"
	echo "hier muss was stehen" > /dev/null
else
	echo "2"
	# 2 = Couldnt connect to server (http)
	exit
fi

panelget="$(/usr/bin/curl -s http://USER:PW@10.10.10.184/action/panelCondGet)"
devicelist="$(/usr/bin/curl -s http://USER:PW@10.10.10.184/action/deviceListGet | grep battery_ok | grep -o '[0-9]*')"

area1_mode=$(echo $panelget | awk '{print $7}' | grep -o '[0-9]*')

case $1 in
	area1)
		echo $area1_mode
		# Response-Codes:
		# 0 = Disarmed
		# 1 = Armed
	;;
	# Notausgang Feuertreppe
	feuertreppe_cond_ok)
		echo $devicelist | awk '{print $1}'
	;;
	feuertreppe_battery_ok)
		echo $devicelist | awk '{print $2}'
	;;
	# Treppenhaus R6.8
	treppenhaus68_cond_ok)
		echo $devicelist | awk '{print $3}'
	;;
	treppenhaus68_battery_ok)
		echo $devicelist | awk '{print $3}'
	;;
	# Treppenhaus Aufzug
	treppenhaus_aufzug_cond_ok)
		echo $devicelist | awk '{print $9}'
	;;
	reppenhaus_aufzug_battery_ok)
		echo $devicelist | awk '{print $10}'
	;;
esac
