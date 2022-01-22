FROM debian:buster-slim
MAINTAINER Mohsen Abbasi <developer961@gmail.com>

RUN apt-get -y update && apt-get install -y polipo

COPY polipo.conf /etc/polipo/config

EXPOSE 8123

ENTRYPOINT ["polipo"]
CMD []


