#!/bin/bash

if [ -n "$1" ]
then
	if [ -n "$2" ]
	then

		mkdir -p /etc/zabbix/zabbix_agentd.d/
		sed -e '/LogFileSize=0/ s/^#*/#/' -i $1
		sed -e '/Server=127.0.0.1/ s/^#*/#/' -i $1
		sed -e '/ServerActive=127.0.0.1/ s/^#*/#/' -i $1
		sed -e '/Hostname=Zabbix server/ s/^#*/#/' -i $1
		echo >> $1
		echo >> $1
		echo >> $1
		echo "Include=/etc/zabbix/zabbix_agentd.d/" >> $1
		echo "LogFileSize=10" >> $1
		echo "Timeout=15" >> $1
		echo >> $1
		echo "Server=zabbix.aixit.com" >> $1
		echo "ServerActive=zabbix.aixit.com" >> $1
		echo "Hostname=$2" >> $1
		/etc/init.d/zabbix-agent restart
		systemctl restart zabbix-agent.service
		echo "Finished"
		#echo "You must edit Hostname!!"
		echo


	else
	echo "usage:"
	echo "zabbix_agent.sh config-file-path Hostname"
	exit
	fi
else
echo "usage:"
echo "zabbix_agent.sh config-file-path Hostname"
exit
fi
exit


mkdir -p /etc/zabbix/zabbix_agentd.d/

sed -e '/LogFileSize=0/ s/^#*/#/' -i $1
sed -e '/Server=127.0.0.1/ s/^#*/#/' -i $1
sed -e '/ServerActive=127.0.0.1/ s/^#*/#/' -i $1
sed -e '/Hostname=Zabbix server/ s/^#*/#/' -i $1
echo >> $1
echo >> $1
echo >> $1
echo "Include=/etc/zabbix/zabbix_agentd.d/" >> $1
echo "LogFileSize=10" >> $1
echo "Timeout=15" >> $1
echo >> $1
echo "Server=zabbix.aixit.com" >> $1
echo "ServerActive=zabbix.aixit.com" >> $1
echo "Hostname=$2" >> $1
/etc/init.d/zabbix-agent restart
systemctl restart zabbix-agent.service
echo "Finished"
#echo "You must edit Hostname!!"
echo

