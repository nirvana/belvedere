FROM ubuntu:trusty
MAINTAINER Songge Chen <chen.s@wustl.edu>

ENV project-name belvedere

RUN locale-gen en_US.UTF-8
ENV LANG en_US.UTF-8
ENV LANGUAGE en_US:en
ENV LC_ALL en_US.UTF-8

RUN apt-get update && apt-get -y upgrade
RUN apt-get install -y \
curl \
build-essential \
libncurses5-dev \
git \
fop \
openjdk-6-jdk \
libssl-dev \
unixodbc-dev \
g++ \
libwxbase2.8 \
libwxgtk2.8-dev \
libgtk2.0-dev \
libqt4-opengl-dev

ADD . /root/belvedere
WORKDIR /root/belvedere

RUN chmod 755 /root/belvedere/scripts/ci/prepare.sh
RUN chmod 755 /root/belvedere/scripts/ci/test.sh

RUN /root/belvedere/scripts/ci/prepare.sh
RUN /root/belvedere/scripts/ci/test.sh
