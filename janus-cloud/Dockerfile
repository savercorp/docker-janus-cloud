FROM ubuntu:20.04

# Install Dependencies
RUN apt-get update -y && apt-get install -y python3-pip git

# Install janus-cloud
RUN git clone https://github.com/OpenSight/janus-cloud.git -b v0.8.0 --depth 1 /opt/janus-cloud && \
    pip3 install /opt/janus-cloud
COPY janus-proxy.yml /opt/janus-cloud/conf/janus-proxy.yml

# Create user
ARG user=janus-cloud
ARG group=janus-cloud
ARG uid=1000
ARG gid=1000
RUN groupadd -g ${gid} ${group} && \
    useradd -u ${uid} -g ${gid} -m ${user} && \
    chown ${uid}:${gid} /opt/janus-cloud/conf
USER ${user}
