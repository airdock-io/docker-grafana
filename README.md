# docker-grafana

Try the latest available Grafana package with this simple Dockerfile based on our lovely _airdock-base_.

**Usage**

You can build the container by cloning the github project or simply pull & run it from the Docker registry.

Examples:

**Build & Run**:
```
git clone https://github.com/airdock-io/docker-grafana
cd docker-grafana
docker build -t grafana .
docker run -d -p 3000:3000 -t grafana
```
You Grafana web UI is now available via http://your.server.ip:3000

(Replace _grafana_ with the tag you want.)


**Pull & Run**
```
docker pull airdock/docker-grafana:latest
docker run -i -p 3000:3000 airdock/docker-grafana
````

_Like the Official Grafana container, you can specify the server root URL & admin password_:

```
docker run -i -p 3000:3000 \
  -e "GF_SERVER_ROOT_URL=http://grafana.server.name"  \
  -e "GF_SECURITY_ADMIN_PASSWORD=changeit"  \
  airdock/docker-grafana
```
By default, login / password are admin / admin

**Volumes**

Volumes available to mount on your local filesystem:

 - "/var/lib/grafana"
 - "/var/log/grafana"
 - "/etc/grafana"
 
_Exemple_
```
docker run -i -p 3000:3000 \
  -e "GF_SERVER_ROOT_URL=http://grafana.server.name"  \
  -e "GF_SECURITY_ADMIN_PASSWORD=changeit"  \
  -d /var/lib/grafana:/data/grafana/lib \
  -d /var/log/grafana:/data/grafana/log \
  -d /etc/grafana:/data/grafana/etc \
  airdock/docker-grafana
```


**Link your own database**

There is two ways to proceed. You can:
 - Link this container with your own Dockerized DB (InfluxDB / Graphite ..)
 - Fill the empty fields with an existing DB directly in the Grafana web UI

# Coming soon

 - Complete stack with Docker Compose
