FROM ubuntu:20.04

RUN apt-get update -y && apt-get install -y tzdata
ENV TZ Asia/Tokyo

# Install nginx
RUN apt-get install -y nginx

# Install janus-cloud
RUN apt-get install -y python3-pip git
COPY --from=registry.gitlab.saver.jp/saver/container/janus-gateway /root/janus-gateway/html /var/www/html
RUN git clone https://github.com/OpenSight/janus-cloud.git /opt/janus-cloud && \
    pip3 install /opt/janus-cloud && \
    cp /opt/janus-cloud/html/* /var/www/html/ && \
    sed -i -e 's/gatewayCallbacks\.server/`ws:\/\/${window.location.hostname}:8288`/g' /var/www/html/janus.js
COPY janus-proxy.yml /opt/janus-cloud/conf/janus-proxy.yml

ENTRYPOINT nginx && janus-proxy
