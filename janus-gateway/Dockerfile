FROM registry.gitlab.saver.jp/saver/container/janus-gateway:0.10.7

# Install janus-cloud
RUN pip3 install janus-cloud
COPY janus-sentinel.yml /opt/janus-cloud/conf/janus-sentinel.yml

ENTRYPOINT nginx && /opt/janus/bin/janus & janus-sentinel
