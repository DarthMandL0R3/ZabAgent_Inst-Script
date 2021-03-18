#!/bin/bash

###Editing Zabbix agent configuration file
echo "Editing Zabbix agent config file.."
echo "----------------------------------"

#cp -p /root/backup/zabbix_agentd.conf /root/backup/zabbix_agentd.conf.bak
#sleep 2s

FILE=/etc/zabbix/zabbix_agentd.conf
NAME=`hostname -f`

sed -i -r 's/127.0.0.1$/10.10.0.190/g;s/Hostname=Zabbix server/Hostname='"$NAME"'/g' $FILE
sleep 2s

echo "Done"

exit 0
