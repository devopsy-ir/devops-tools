FROM debian:bullseye-slim
MAINTAINER Mohsen Abbasi <developer961@gmail.com>

RUN apt-get -y update && apt-get install -y tor &&  apt-get install -y obfs4proxy 

COPY tor.conf /etc/tor/torrc

EXPOSE 9050

ENTRYPOINT ["tor"]
CMD []
