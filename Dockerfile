FROM ubuntu:trusty

MAINTAINER Songge Chen <chen.s@wustl.edu>

#Set Project Environment Variables
ENV CIRCLE_PROJECT_REPONAME belvedere
ENV ERLANG_VERSION 17.5
ENV ELIXIR_VERSION v1.0.4

ENV MIX_ENV test

RUN apt-get update

RUN apt-get -y install \
    curl \
    git \
    autoconf \
    libncurses-dev \
    build-essential \ 
    libssl-dev \
    libcurl4-openssl-dev

RUN curl -O https://packages.erlang-solutions.com/erlang-solutions_1.0_all.deb && \
    dpkg -i erlang-solutions_1.0_all.deb

RUN locale-gen en_US.UTF-8
ENV LANG en_US.UTF-8
ENV LANGUAGE en_US:en
ENV LC_ALL en_US.UTF-8




ADD . /root/belvedere
WORKDIR /root/belvedere

RUN \ 
    chmod 755 /root/belvedere/scripts/ci/prepare.sh && \
    chmod 755 /root/belvedere/scripts/ci/build.sh && \
    chmod 755 /root/belvedere/scripts/ci/test.sh

RUN \ 
    /root/belvedere/scripts/ci/prepare.sh && \
    /root/belvedere/scripts/ci/build.sh
