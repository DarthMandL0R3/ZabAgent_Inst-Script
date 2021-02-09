#!/bin/bash

###Warning: Please run this script as root user###

#Author: Abrar and Geng.
#Version: 1.0.

#Description: This script will install Zabbix agent on RHEL server.

file="/root/.zabbix_agent-install"

if [ ! -f "$file" ]
then
	echo "$0: File '${file}' has not been created. Proceeding with agent installation."
else
	echo "$0: File '${file}' has been created. ENDING THE SCRIPT."
	exit 1
fi

###Install Essential Packages###
echo "Installing Zabbix repository.."
echo "------------------------------"
rpm -Uvh https://repo.zabbix.com/zabbix/5.0/rhel/7/x86_64/zabbix-release-5.0-1.el7.noarch.rpm
sleep 5s
echo "---------------------------"
echo "Zabbix repository installed"

###Install Zabbix agent###
echo "Install Zabbix agent.."
echo "----------------------"
yum install -y zabbix zabbix-agent
sleep 5s
echo "------------------"
echo "Zabbix agent installed"

###Enabling Port 10050 in Firewall###
echo "Enabling port 10050/tcp on firewall.."
echo "-----------------------------------------"
/usr/bin/firewall-cmd --permanent --add-port=10050/tcp
/usr/bin/firewall-cmd --reload
sleep 5s
echo "------------------"
echo "Port 10050 enabled"

###Edit ULimit###
#echo "Starting Zabbix agent service.."
#echo "----------------"
#systemctl enable zabbix-agent
#systemctl start zabbix-agent
#systemctl status zabbix-agent
#sleep 5s
#echo "-------------"
#echo "Zabbix agent have been started"

echo "THIS SCRIPT ALREADY RUN BY $(whoami) at $(date)" > /root/.zabbix_agent-install
sleep 5s

echo "############################################"
echo "The script have been completed successfully."
echo "############################################"

exit 0