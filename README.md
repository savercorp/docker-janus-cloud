# docker-janus-cloud

Docker image for [Janus Cloud](https://github.com/OpenSight/janus-cloud).

## Getting Started

```yaml
version: "3"

services:
  janus-proxy:
    image: saverops/janus-proxy
    ports:
      - 8288:8288
  janus:
    image: saverops/janus-gateway
    ports:
      - 8188:8188
```

```bash
$ docker-compose up -d
```

## Custom config

```yaml
version: "3"

services:
  janus-proxy:
    image: saverops/janus-proxy
    ports:
      - 8288:8288
    volumes:
      - ./conf/janus-proxy.plugin.videoroom.yml:/opt/janus-cloud/conf/janus-proxy.plugin.videoroom.yml
  janus:
    image: saverops/janus-gateway
    command: ['-d', '7']
    ports:
      - 8188:8188
    volumes:
      - ./conf/janus.jcfg:/opt/janus/etc/janus/janus.jcfg
      - ./conf/janus-sentinel.yml:/opt/janus-cloud/conf/janus-sentinel.yml
```

```bash
$ docker-compose up -d
```

## Build

```bash
$ docker buildx build --platform=linux/arm64,linux/amd64 --push \
  -t saverops/janus-proxy \
  -t saverops/janus-proxy:0.5.0 janus-proxy
$ docker buildx build --platform=linux/arm64,linux/amd64 --push \
  -t saverops/janus-gateway \
  -t saverops/janus-gateway:0.5.0 janus-gateway
```
