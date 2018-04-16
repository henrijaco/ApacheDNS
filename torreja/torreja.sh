#!/bin/bash
/etc/init.d/apache2 start
mkdir /var/www/torreja.com
mkdir /var/www/torreja.com/public_html
echo -e "<html>
<head>
<title>Prueba</title>
</head>
<body>
<h1>Esta es la pagina de inicio</h1>
<p>
Cum on feel the noize
Girls rock your boys
We get wild, wild, wild
Wild, wild, wild
</p>
<p>
So you think I got an evil mind
I'll tell you honey
That I don't know why
I don't know why
</p>
</body>
</html>">/var/www/torreja.com/public_html/index.html
echo -e "
<VirtualHost *:*>\n
        ServerAdmin jl14001@ues.edu.sv
        ServerName torreja.com
        ServerAlias www.torreja.com
        DocumentRoot /var/www/torreja.com/public_html
        ErrorLog ${APACHE_LOG_DIR}/error.log
        CustomLog ${APACHE_LOG_DIR}/access.log combined
</VirtualHost>">/etc/apache2/sites-available/torreja.com.conf
a2ensite torreja.com.conf
a2dissite 000-default.conf
/etc/init.d/apache2 reload
hostname -I
tcpdump


