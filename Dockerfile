FROM ubuntu:18.04
LABEL MAINTAINER="db@donbowman.ca"

ENV DEBIAN_FRONTEND=noninteractive


RUN apt-get update \
    && apt-get --no-install-recommends -y install openssh-server rsync \
    && mkdir -p /sync /home/rsync/.ssh \
    && useradd -d /home/rsync -g 0 -M -N -o -s /bin/sh -u 0 rsync \
    && chmod 700 /home/rsync/.ssh /home/rsync \
    && rm -rf /var/lib/apt/lists/*

COPY scripts/ /scripts/
ENTRYPOINT ["/scripts/entrypoint.sh"]
