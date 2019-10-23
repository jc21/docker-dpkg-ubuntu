FROM ubuntu:eoan

MAINTAINER Jamie Curnow <jc@jc21.com>
LABEL maintainer="Jamie Curnow <jc@jc21.com>"

ENV DEBIAN_FRONTEND=noninteractive

# Apt
RUN apt-get update \
  && apt-get install -y wget make devscripts build-essential git curl automake autoconf expect sudo apt-utils reprepro equivs apt-transport-https jq zip dh-make debhelper

RUN apt-get update \
  && apt-get install -y git \
  && apt-get clean

# Remove requiretty from sudoers main file
RUN sed -i '/Defaults    requiretty/c\#Defaults    requiretty' /etc/sudoers

# Rpm User
RUN useradd -G sudo builder \
    && mkdir -p /home/builder \
    && chmod -R 777 /home/builder

# Sudo
ADD etc/sudoers.d/builder /etc/sudoers.d/
RUN chown root:root /etc/sudoers.d/*

USER builder
WORKDIR /home/builder
