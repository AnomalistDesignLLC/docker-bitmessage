FROM alpine:3.7
MAINTAINER Matthew Raymer <matthew.raymer@anomalistdesign.com>

RUN echo "@edge http://nl.alpinelinux.org/alpine/edge/main" >> /etc/apk/repositories && \
    echo "@testing http://nl.alpinelinux.org/alpine/edge/testing" >> /etc/apk/repositories && \
    echo "@community http://nl.alpinelinux.org/alpine/v3.7/community" >> /etc/apk/repositories && \
    echo "@edgecommunity http://nl.alpinelinux.org/alpine/edge/community" >> /etc/apk/repositories

WORKDIR /root

ENV RPC_USER bitmessagerpc
ENV RPC_PASS P@ssw0rd
ENV SOCKS_TYPE none
ENV SOCKS_HOSTNAME localhost
ENV SOCKS_PORT 9050
ENV SOCKS_AUTH false
ENV SOCKS_USERNAME socksuser
ENV SOCKS_PASSWORD socks@user
ENV SOCKS_LISTEN 9050

RUN apk add --no-cache --update --upgrade py-pip python collectd supervisor git bash curl && rm -rf /tmp/* 
    
RUN pip install --upgrade pip
RUN pip install msgpack-python
RUN pip install envtpl

RUN git clone https://github.com/Bitmessage/PyBitmessage
COPY docker-entrypoint.sh /usr/local/bin/
COPY keys.dat.tpl /root/
ENTRYPOINT ["docker-entrypoint.sh"]

EXPOSE 8444 8442
VOLUME ["/root/.config/PyBitmessage"]
CMD ["/usr/bin/python", "/root/PyBitmessage/src/bitmessagemain.py"]
