# docker-janus-cloud

Docker image for [Janus Cloud](https://github.com/OpenSight/janus-cloud).

## Getting Started

```yaml
version: "3"

services:
  janus-proxy:
    image: saverops/janus-cloud
    command: janus-proxy
    ports:
      - 8288:8288
  janus:
    build: janus-gateway
    ports:
      - 8188:8188
```

Create Dockerfile for backend server like this.

```Dockerfile
FROM saverops/janus-gateway:0.10.7

USER root

COPY --from=saverops/janus-cloud /opt/janus-cloud /opt/janus-cloud
COPY janus-sentinel.yml /opt/janus-cloud/conf/janus-sentinel.yml
RUN pip3 install /opt/janus-cloud

USER janus

EXPOSE 8188
ENTRYPOINT janus-sentinel & /opt/janus/bin/janus
```

```bash
$ docker-compose up -d
```

## Custom config

```yaml
version: "3"

services:
  janus-proxy:
    image: saverops/janus-cloud
    command: janus-proxy
    ports:
      - 8288:8288
    volumes:
      - ./conf/janus-proxy.plugin.videoroom.yml:/opt/janus-cloud/conf/janus-proxy.plugin.videoroom.yml
  janus:
    build: janus-gateway
    ports:
      - 8188:8188
    volumes:
      - ./conf/janus.jcfg:/opt/janus/etc/janus/janus.jcfg
      - ./conf/janus-sentinel.yml:/opt/janus-cloud/conf/janus-sentinel.yml
```

```bash
$ docker-compose up -d
```
