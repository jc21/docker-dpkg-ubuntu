FROM jc21/dpkg-ubuntu:eoan

MAINTAINER Jamie Curnow <jc@jc21.com>
LABEL maintainer="Jamie Curnow <jc@jc21.com>"

USER root

RUN apt-get install -y golang-1.13

USER builder

# installed in /usr/lib/go-1.13
ENV GOROOT=/usr/lib/go-1.13
ENV GOPATH=/home/builder/go
ENV PATH="/usr/lib/go-1.13/bin:/home/builder/go/bin:${PATH}"
