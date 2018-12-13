#!/bin/bash

# recreate the template to be able to set properties
cp /etc/fahclient/config_template.xml /etc/fahclient/config.xml
echo "running fahclient as ${USERNAME} for the TEAM ${TEAM} and ${POWER} power"
sed -i -e "s/{{USERNAME}}/$USERNAME/;s/{{TEAM}}/$TEAM/;s/{{POWER}}/$POWER/" /etc/fahclient/config.xml

nohup /etc/init.d/FAHClient start >> /var/lib/fahclient/log.txt 2>&1 &
tail -F /var/lib/fahclient/log.txt