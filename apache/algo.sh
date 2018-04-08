#!/bin/bash
/etc/init.d/apache2 start
a2ensite torreja.com.conf
a2dissite 000-default.conf
/etc/init.d/apache2 reload
hostname -I
tcpdump


