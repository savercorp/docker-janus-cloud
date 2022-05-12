# janus-cloud

Janus Cloud Docker image.

## Getting Started

```yaml
version: "3"

services:
  signaling:
    image: registry.gitlab.saver.jp/saver/container/janus-cloud/janus-proxy
    ports:
      - 8288:8288
  media:
    image: registry.gitlab.saver.jp/saver/container/janus-cloud/janus-gateway
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
  signaling:
    image: registry.gitlab.saver.jp/saver/container/janus-cloud/janus-proxy
    ports:
      - 8288:8288
    volumes:
      - ./conf/janus-proxy.plugin.videoroom.yml:/opt/janus-cloud/conf/janus-proxy.plugin.videoroom.yml
  media:
    image: registry.gitlab.saver.jp/saver/container/janus-cloud/janus-gateway
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
