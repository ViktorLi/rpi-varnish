FROM balenalib/rpi-debian:stretch-build

LABEL io.balena.device-type="raspberry-pi"

RUN apt-get update && apt-get install -y --no-install-recommends \
		nano \
		net-tools \
        varnish \
    && rm -rf /var/lib/apt/lists/*

COPY default.vcl /etc/varnish/default.vcl

ADD start.sh /start.sh

ENV VCL_CONFIG /etc/varnish/default.vcl
ENV CACHE_SIZE 64m
ENV VARNISHD_PARAMS -p default_ttl=3600 -p default_grace=3600

CMD ["bash", "/start.sh"]

EXPOSE 8090
