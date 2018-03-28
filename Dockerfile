FROM alpine:3.2
MAINTAINER Matthew Raymer <matthew.raymer@anomalistdesign.com>

WORKDIR /root
ENV RPC_USER bitmessagerpc
ENV RPC_PASS P@ssw0rd
ENV RPC_INTERFACE localhost

RUN apk add --update python openssl collectd supervisor git && rm -rf /var/cache/apk/*

RUN git clone https://github.com/Bitmessage/PyBitmessage
COPY docker-entrypoint.sh /usr/local/bin/
ENTRYPOINT ["docker-entrypoint.sh"]

EXPOSE 8444 8442
VOLUME ["/root/.config/PyBitmessage"]
CMD ["/usr/bin/python", "/root/PyBitmessage/src/bitmessagemain.py"]
