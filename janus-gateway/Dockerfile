FROM saverops/janus-gateway:0.10.7

USER root

COPY --from=saverops/janus-cloud /opt/janus-cloud /opt/janus-cloud
COPY janus-sentinel.yml /opt/janus-cloud/conf/janus-sentinel.yml
RUN pip3 install /opt/janus-cloud

USER janus

EXPOSE 8188
ENTRYPOINT janus-sentinel & /opt/janus/bin/janus
