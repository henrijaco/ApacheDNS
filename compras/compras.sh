#!/bin/bash
/etc/init.d/apache2 start
mkdir /var/www/torreja.com
mkdir /var/www/torreja.com/compras
echo -e "<html>
  <head>
    <title>Compras</title>
    <meta charset="UTF-8">
    <style>
    h1 {color:red;
        text-align: center;
        font-family: "Montserrat", sans-serif;
        }
    p {color:blue;
       text-align: center;
       font-family: "Montserrat", sans-serif;
       font-size: 20px;
      }
    </style>
  </head>
  <body>
  <h1>Proximamente podras comprar cosas aqui</h1>
  <p>
  Zafo que el obispo ponga su opinión<br>
  Mega zafo la mochiza zafo-zafo calderón<br>
  Oiga, ya salió mi disco vaya why comprelo pirata<br>
  Ayude a la disquera a que nos meta más la riata.<br>
  Zafo el puto tráfico, zafo el tira grosero<br>
  Why zafo enseñarle a manejar al del pesero<br>
  Si vienes por acá cuidado cuando salgas<br>
  Porque este país se maneja con las nalgas.
  </p>
  </body>
</html>">/var/www/torreja.com/compras/index.html
echo -e "
<IfModule mod_ssl.c>
        <VirtualHost _default_:443>
                ServerAdmin jl14001@ues.edu.sv
                ServerName www.torreja.com
                ServerAlias www.torreja.com/compras
                DocumentRoot /var/www/torreja.com/compras
                SSLEngine on
                SSLProxyEngine on
                SSLCertificateFile /etc/ssl/certs/ssl-cert-snakeoil.pem
                SSLCertificateKeyFile /etc/ssl/private/ssl-cert-snakeoil.key
                ErrorLog ${APACHE_LOG_DIR}/error.log
                CustomLog ${APACHE_LOG_DIR}/ssl_access.log combined
        </VirtualHost>
</IfModule>">/etc/apache2/sites-available/default-ssl.conf
a2enmod ssl
a2ensite default-ssl.conf
/etc/init.d/apache2 restart
hostname -I
tcpdump
