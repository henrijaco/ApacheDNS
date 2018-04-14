FROM debian:stretch
MAINTAINER henrijacobo@hotmail.com
RUN apt-get update && apt-get install -yq apt-utils apache2 tcpdump && apt-get clean
COPY compras.sh /compras.sh
CMD ["./compras.sh"] 
EXPOSE 443
ENTRYPOINT ["/bin/bash"]
