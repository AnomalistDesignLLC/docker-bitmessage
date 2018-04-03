FROM alpine:3.7
MAINTAINER Matthew Raymer <matthew.raymer@anomalistdesign.com>

RUN echo "@edge http://nl.alpinelinux.org/alpine/edge/main" >> /etc/apk/repositories && \
    echo "@testing http://nl.alpinelinux.org/alpine/edge/testing" >> /etc/apk/repositories && \
    echo "@community http://nl.alpinelinux.org/alpine/v3.7/community" >> /etc/apk/repositories && \
    echo "@edgecommunity http://nl.alpinelinux.org/alpine/edge/community" >> /etc/apk/repositories

WORKDIR /root

ENV RPC_USER="bitmessagerpc"
ENV RPC_PASS="P@ssw0rd"

ENV SOCKS_TYPE="none"
ENV SOCKS_HOSTNAME="localhost"
ENV SOCKS_PORT=9050
ENV SOCKS_AUTH="False"
ENV SOCKS_USERNAME=""
ENV SOCKS_PASSWORD=""
ENV SOCKS_LISTEN="False"

ENV TOR_ENV="production"
ENV TOR_VER="0.3.2.10"
ENV TOR_MD5=""

ENV TOR_URL="https://www.torproject.org/dist/tor-$TOR_VER.tar.gz"
ENV TOR_FILE="tor.tar.gz"
ENV TOR_TEMP tor-$TOR_VER

RUN apk update \
    && apk upgrade \
    && apk add --no-cache --update --upgrade runit@testing py-pip python python-dev collectd supervisor git bash curl build-base gmp-dev libevent libevent-dev libgmpxx openssl openssl-dev dnsmasq proxychains-ng \
    && wget -O $TOR_FILE $TOR_URL \
    && tar xzf $TOR_FILE \
    && cd $TOR_TEMP \
    && ./configure --prefix=/ --exec-prefix=/usr \
    && make install \
    && cd .. \
    && rm -Rf $TOR_FILE $TOR_TEMP \
    && rm -Rf /tmp/* \
    && git clone https://github.com/Bitmessage/PyBitmessage
RUN pip install --upgrade pip
RUN pip install msgpack-python
RUN pip install envtpl
RUN pip install --trusted-host fteproxy obfsproxy

RUN apk del build-base git gmp-dev go python-dev && rm -rf /root/.cache/pip/*
RUN addgroup -g 19001 -S tord && adduser -u 19001 -G tord -S tord && mkdir -p /etc/tor/

COPY ./torrc /etc/tor/torrc
COPY docker-entrypoint.sh /usr/local/bin/
COPY keys.dat.tpl /root/

#ENTRYPOINT ["docker-entrypoint.sh"]

EXPOSE 8444 8442

VOLUME ["/root/.config/PyBitmessage"]

COPY service /etc/service/

CMD ["runsvdir", "/etc/service"]