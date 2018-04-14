FROM debian:stretch
MAINTAINER henrijacobo@hotmail.com
RUN apt-get update && apt-get install -yq apt-utils apache2 tcpdump && apt-get clean
COPY algo.sh /algo.sh
CMD ["./algo.sh"]
EXPOSE 80
ENTRYPOINT ["/bin/bash"]
