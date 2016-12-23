# VERSION 2.0
# AUTHOR:         Antoine Serrano <heyitsmozzie@gmail.com>
# SOURCE:         https://github.com/airdock/docker-grafana

# Pull base image.
FROM airdock/base:latest
MAINTAINER Antoine Serrano <heyitsmozzie@gmail.com>

RUN apt-get update && apt-get -y install libfontconfig wget adduser openssl ca-certificates && \
  wget https://grafanarel.s3.amazonaws.com/builds/grafana_4.0.2-1481203731_amd64.deb && \
  dpkg -i grafana_4.0.2-1481203731_amd64.deb && \
  /root/post-install

EXPOSE 3000

VOLUME ["/var/lib/grafana", "/var/log/grafana", "/etc/grafana"]

WORKDIR /usr/share/grafana

ENTRYPOINT ["/usr/sbin/grafana-server", "--config", "/etc/grafana/grafana.ini"]
