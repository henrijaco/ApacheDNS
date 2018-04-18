FROM debian:stretch
MAINTAINER henrijacobo@hotmail.com
RUN apt-get update && apt-get install -yq apt-utils apache2 tcpdump && apt-get clean
COPY intranet.sh /intranet.sh
COPY newcert.pem /etc/ssl/certs/newcert.pem
COPY newkey.pem /etc/ssl/private/newkey.pem
CMD ["./intranet.sh"]
EXPOSE 443
ENTRYPOINT ["/bin/bash"]
