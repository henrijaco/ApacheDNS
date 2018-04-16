#!/bin/bash
/etc/init.d/apache2 start
a2enmod proxy && a2enmod proxy_http
PEPE=$(getent hosts torreja | awk '{print $1}')
echo "" >/etc/apache2/sites-available/000-default.conf
echo -e "
NameVirtualHost *
<VirtualHost *>
    ServerName www.torreja.com
    ProxyRequests Off
    <Proxy *>
        Order deny,allow
        Allow from all
    </Proxy>

    ProxyPass / http://${PEPE}:80/
    ProxyPassReverse / http://${PEPE}:80/
    <Location />
        Order allow,deny
        Allow from all
    </Location>
</VirtualHost>">/etc/apache2/sites-available/000-default.conf
/etc/init.d/apache2 reload
hostname -I
tcpdump


