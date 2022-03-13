# janus-cloud

Janus Cloud Docker image.

## Getting Started

80 port (web server) is only for trial not for production.

```yaml
version: "3"

services:
  signaling:
    image: registry.gitlab.saver.jp/saver/container/janus-cloud/janus-proxy
    ports:
      - 8288:8288
      - 80:80
  media:
    image: registry.gitlab.saver.jp/saver/container/janus-cloud/janus-gateway
    ports:
      - 8188:8188
    depends_on:
      - signaling
```

```bash
$ docker-compose up -d
```

## Custom config

If you want your own configuration.  
Mount config like this.

```yaml
version: "3"

services:
  signaling:
    image: registry.gitlab.saver.jp/saver/container/janus-cloud/janus-proxy
    ports:
      - 8288:8288
      - 80:80
    volumes:
      - ./conf/janus-proxy.plugin.videoroom.yml:/opt/janus-cloud/conf/janus-proxy.plugin.videoroom.yml
  media:
    image: registry.gitlab.saver.jp/saver/container/janus-cloud/janus-gateway
    ports:
      - 8188:8188
    depends_on:
      - signaling
    volumes:
      - ./conf/janus.jcfg:/opt/janus/etc/janus/janus.jcfg
      - ./conf/janus-sentinel.yml:/opt/janus-cloud/conf/janus-sentinel.yml
```

```bash
$ docker-compose up -d
```
