#! /bin/bash
/etc/init.d/bind9 start
TEST_VAR=$(hostname -I)
PEPE=$(getent hosts proxy | awk '{print $1}')
echo -e "\n 
@           IN      SOA     dns1.torreja.com. henri.uesocc.edu.sv. ( \n
                        2018103        ; Serial\n 
                        604800         ; Refresh\n
                         86400         ; Retry\n
                       2419200         ; Expire\n
                        604800 )       ; Negative Cache TTL\n
;\n
@          IN      NS      dns1.torreja.com.\n
dns1       IN      A       $TEST_VAR\n
@          IN      A       $TEST_VAR\n
www        IN      A       $PEPE " > /etc/bind/db.torreja 

printf "\n\n%s\n\t%s\n\t%s\n%s" "zone \"torreja.com\" {" "type master;" "file \"/etc/bind/db.torreja\";" "};" >> /etc/bind/named.conf.default-zones
named-checkzone -i full torreja.com /etc/bind/db.torreja
/etc/init.d/bind9 restart
hostname -I
tcpdump

