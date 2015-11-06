# docker-grafana [![](https://badge.imagelayers.io/airdock/grafana:latest.svg)](https://imagelayers.io/?images=airdock/grafana:latest 'Get your own badge on imagelayers.io')

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
docker pull airdock/grafana:latest
docker run -i -p 3000:3000 airdock/grafana
````

_Like the Official Grafana container, you can specify the server root URL & admin password_:

```
docker run -i -p 3000:3000 \
  -e "GF_SERVER_ROOT_URL=http://grafana.server.name"  \
  -e "GF_SECURITY_ADMIN_PASSWORD=changeit"  \
  airdock/grafana
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
  -v /data/grafana/lib:/var/lib/grafana \
  -v /data/grafana/log:/var/log/grafana \
  -v /data/grafana/etc:/etc/grafana \
  airdock/grafana
```


**Link your own database**

There is two ways to proceed. You can:
 - Link this container with your own Dockerized DB (InfluxDB / Graphite ..)
 - Fill the empty fields with an existing DB directly in the Grafana web UI


 # MIT License

 ```
 The MIT License (MIT)

 Copyright (c) 2015 Airdock.io

 Permission is hereby granted, free of charge, to any person obtaining a copy
 of this software and associated documentation files (the "Software"), to deal
 in the Software without restriction, including without limitation the rights
 to use, copy, modify, merge, publish, distribute, sublicense, and/or sell
 copies of the Software, and to permit persons to whom the Software is
 furnished to do so, subject to the following conditions:

 The above copyright notice and this permission notice shall be included in
 all copies or substantial portions of the Software.

 THE SOFTWARE IS PROVIDED "AS IS", WITHOUT WARRANTY OF ANY KIND, EXPRESS OR
 IMPLIED, INCLUDING BUT NOT LIMITED TO THE WARRANTIES OF MERCHANTABILITY,
 FITNESS FOR A PARTICULAR PURPOSE AND NONINFRINGEMENT. IN NO EVENT SHALL THE
 AUTHORS OR COPYRIGHT HOLDERS BE LIABLE FOR ANY CLAIM, DAMAGES OR OTHER
 LIABILITY, WHETHER IN AN ACTION OF CONTRACT, TORT OR OTHERWISE, ARISING FROM,
 OUT OF OR IN CONNECTION WITH THE SOFTWARE OR THE USE OR OTHER DEALINGS IN
 THE SOFTWARE.
 ```
