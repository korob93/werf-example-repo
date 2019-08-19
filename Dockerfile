FROM nginx:stable

ADD https://github.com/just-containers/s6-overlay/releases/download/v1.21.4.0/s6-overlay-amd64.tar.gz /tmp/s6-overlay.tar.gz

COPY rootfs /

RUN tar xfz /tmp/s6-overlay.tar.gz -C / && \
    rm -f /tmp/*.tar.gz

EXPOSE 80

ENTRYPOINT [ "/init" ]