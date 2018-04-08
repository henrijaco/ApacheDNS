FROM debian:stretch
MAINTAINER henrijacobo@hotmail.com
RUN apt-get update && apt-get install -yq apt-utils dnsutils bind9 tcpdump && apt-get clean
EXPOSE 53
COPY script.sh /script.sh
CMD ["./script.sh"]
ENTRYPOINT ["/bin/bash"]
