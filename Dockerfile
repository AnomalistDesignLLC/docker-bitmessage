FROM alpine:3.7
MAINTAINER Matthew Raymer <matthew.raymer@anomalistdesign.com>

RUN echo "@edge http://nl.alpinelinux.org/alpine/edge/main" >> /etc/apk/repositories && \
    echo "@testing http://nl.alpinelinux.org/alpine/edge/testing" >> /etc/apk/repositories && \
    echo "@community http://nl.alpinelinux.org/alpine/v3.7/community" >> /etc/apk/repositories && \
    echo "@edgecommunity http://nl.alpinelinux.org/alpine/edge/community" >> /etc/apk/repositories

WORKDIR /root
ENV RPC_USER bitmessagerpc
ENV RPC_PASS P@ssw0rd
ENV RPC_INTERFACE localhost

RUN apk add --no-cache --update --upgrade py-pip python collectd supervisor git bash curl && \
    curl -o /usr/bin/envtpl -L https://github.com/appcelerator/envtpl/blob/v1.0.0/envtpl?raw=true && \
    chmod a+x /usr/bin/envtpl && \
    rm -rf /tmp/* 
    
RUN pip install --upgrade pip
RUN pip install msgpack-python

RUN git clone https://github.com/Bitmessage/PyBitmessage
COPY docker-entrypoint.sh /usr/local/bin/
COPY keys.dat.tpl /root/
ENTRYPOINT ["docker-entrypoint.sh"]

EXPOSE 8444 8442
VOLUME ["/root/.config/PyBitmessage"]
CMD ["/usr/bin/python", "/root/PyBitmessage/src/bitmessagemain.py"]
