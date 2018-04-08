FROM debian:stretch
MAINTAINER henrijacobo@hotmail.com
RUN apt-get update && apt-get install -yq apt-utils apache2 tcpdump && apt-get clean
RUN /etc/init.d/apache2 start 
COPY algo.sh /algo.sh
CMD ["mkdir", "/var/www/torreja.com/public_html"]
COPY index.html /var/www/torreja.com/public_html/index.html
COPY torreja.com.conf /etc/apache2/sites-available/torreja.com.conf
CMD ["./algo.sh"]
EXPOSE 80
ENTRYPOINT ["/bin/bash"]
