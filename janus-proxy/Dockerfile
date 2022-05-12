FROM ubuntu:20.04

# Install janus-cloud
RUN apt-get update -y && apt-get install -y python3-pip git
RUN git clone https://github.com/OpenSight/janus-cloud.git /opt/janus-cloud && \
    pip3 install /opt/janus-cloud
COPY janus-proxy.yml /opt/janus-cloud/conf/janus-proxy.yml

ENTRYPOINT janus-proxy
