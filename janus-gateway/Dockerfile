FROM registry.gitlab.saver.jp/saver/container/janus-gateway:0.10.7

# Install janus-cloud
RUN git clone https://github.com/OpenSight/janus-cloud.git /opt/janus-cloud && \
    pip3 install /opt/janus-cloud
COPY janus-sentinel.yml /opt/janus-cloud/conf/janus-sentinel.yml

ENTRYPOINT janus-sentinel & /opt/janus/bin/janus
