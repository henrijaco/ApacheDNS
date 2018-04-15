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
<VirtualHost _default_:443>
        ServerAdmin jl14001@ues.edu.sv
        ServerName torreja.com
        ServerAlias www.torreja.com/compras
        DocumentRoot /var/www/torreja.com/compras
        SSLEngine On
        ErrorLog ${APACHE_LOG_DIR}/error.log
        CustomLog ${APACHE_LOG_DIR}/access.log combined
</VirtualHost>">/etc/apache2/sites-available/torreja.com.conf
a2ensite torreja.com.conf
a2dissite default-ssl.conf 
a2dissite 000-default.conf
a2enmod ssl
/etc/init.d/apache2 reload
hostname -I
tcpdump
