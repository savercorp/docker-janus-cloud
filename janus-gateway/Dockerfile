FROM saverops/janus-gateway

COPY --from=saverops/janus-cloud /usr/local/bin/janus-sentinel /usr/local/bin/janus-sentinel
COPY --from=saverops/janus-cloud /opt/janus-cloud /opt/janus-cloud
COPY janus-sentinel.yml /opt/janus-cloud/conf/janus-sentinel.yml

EXPOSE 8188
ENTRYPOINT janus-sentinel & /opt/janus/bin/janus
