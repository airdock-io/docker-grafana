# VERSION 1.0
# AUTHOR:         Antoine Serrano <heyitsmozzie@gmail.com>
# SOURCE:         https://github.com/airdock/docker-grafana

# Pull base image.
FROM airdock/base:latest
MAINTAINER Antoine Serrano <heyitsmozzie@gmail.com>

RUN apt-get update && apt-get -y install libfontconfig wget adduser openssl ca-certificates && \
  wget https://grafanarel.s3.amazonaws.com/builds/grafana_2.0.1_amd64.deb && \
  dpkg -i grafana_2.0.1_amd64.deb && \
  /root/post-install

EXPOSE 3000

VOLUME ["/var/lib/grafana", "/var/log/grafana", "/etc/grafana"]

WORKDIR /usr/share/grafana

ENTRYPOINT ["/usr/sbin/grafana-server", "--config", "/etc/grafana/grafana.ini"]
