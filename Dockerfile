FROM ubuntu:14.04
MAINTAINER Joshua Noble <acejam@gmail.com>
WORKDIR /root

RUN apt-get update && \
    apt-get install -y python openssl git && \
    apt-get clean && rm -rf /var/lib/apt/lists/* /tmp/* /var/tmp/*

RUN git clone https://github.com/Bitmessage/PyBitmessage
COPY docker-entrypoint.sh /usr/local/bin/
ENTRYPOINT ["docker-entrypoint.sh"]

EXPOSE 8444 8442
VOLUME ["/root/.config/PyBitmessage"]
CMD ["/root/PyBitmessage/src/bitmessagemain.py"]
