#!/bin/bash
/etc/init.d/apache2 start
mkdir /var/www/torreja.com
mkdir /var/www/torreja.com/intranet
echo -e "<html>
  <head>
    <title>Compras</title>
    <meta charset="UTF-8">
    <style>
    body { background-color: #f0f0f0}
    h1 {color:#0d0d0d;
        text-align: center;
        font-family: "Montserrat", sans-serif;
        }
    p {color:black;
       text-align: center;
       font-family: "Montserrat", sans-serif;
       font-size: 20px;
      }
    </style>
  </head>
  <body>
  <h1>Intranet</h1>
  <p>
  Si esta cosa sirve
  deberíamos tener buena nota,
  esperemos que así sea...
  </p>
  </body>
</html>">/var/www/torreja.com/intranet/index.html
echo -e "
<IfModule mod_ssl.c>
        <VirtualHost _default_:443>
                ServerAdmin jl14001@ues.edu.sv
                ServerName www.torreja.com
                ServerAlias www.torreja.com/intranet
                DocumentRoot /var/www/torreja.com/intranet
                SSLEngine on
                SSLProxyEngine on
                SSLCertificateFile /etc/ssl/certs/newcert.pem
                SSLCertificateKeyFile /etc/ssl/private/newkey.pem
                ErrorLog ${APACHE_LOG_DIR}/error.log
                CustomLog ${APACHE_LOG_DIR}/ssl_access.log combined
        </VirtualHost>
</IfModule>">/etc/apache2/sites-available/default-ssl.conf
a2enmod ssl
a2ensite default-ssl.conf
/etc/init.d/apache2 restart
hostname -I
tcpdump
