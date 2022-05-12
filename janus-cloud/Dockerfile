FROM ubuntu:20.04

# Install Dependencies
RUN apt-get update -y && apt-get install -y python3-pip git

# Install janus-cloud
RUN git clone https://github.com/OpenSight/janus-cloud.git /opt/janus-cloud && \
    pip3 install /opt/janus-cloud
