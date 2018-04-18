#!/bin/bash
/etc/init.d/apache2 start
a2enmod proxy && a2enmod proxy_http
PEPE=$(getent hosts torreja | awk '{print $1}')
PEPITO=$(getent hosts compras | awk '{print $1}')
echo "" >/etc/apache2/sites-available/000-default.conf
echo -e "
<VirtualHost *:443>
    ServerName www.torreja.com
    ProxyRequests Off
    ProxyPreserveHost Off
    ProxyPass / https://${PEPE}:443/
    ProxyPassReverse / https://${PEPE}:443/
</VirtualHost>
<VirtualHost *:80>
    ServerName www.torreja.com
    ProxyRequests Off
    ProxyPreserveHost Off
    ProxyPass / http://${PEPE}:80/
    ProxyPassReverse / http://${PEPE}:80/
</VirtualHost>
">/etc/apache2/sites-available/000-default.conf
/etc/init.d/apache2 reload
hostname -I
tcpdump
