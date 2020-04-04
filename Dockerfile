#############################################################
# Dockerfile to run Wolfenstein: Enemy Territory 2.60b server
#############################################################
FROM debian:stretch
MAINTAINER Tom Apeltauer <t.apeltauer@seznam.cz>

COPY . /opt/etpro

WORKDIR /opt/etpro/setup/debian

RUN apt-get update -y && apt-get install -y wget \
    systemd

RUN ./install-software.sh \
    && ./install-common-maps.sh \
    && ./etpro-install.sh \
    && ./etpro-conf-global.sh

# Port to expose
#EXPOSE 27950-27970/tcp
EXPOSE 27950-27970/udp

WORKDIR /srv/wet/

COPY --chown=wet:wet ./startup/run-etpro.sh .
RUN chmod 750 run-etpro.sh

CMD ["./run.sh"]
