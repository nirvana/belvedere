FROM ubuntu:trusty

MAINTAINER Songge Chen <chen.s@wustl.edu>

#Set Your Environment Variables
ENV CIRCLE_PROJECT_REPONAME belvedere
ENV PROJECT_VERSION 0.0.1
ENV PROJECT_MODULE belvedere
ENV GITHUB_USER realmlabs
ENV GITHUB_REPO belvedere

ENV ERLANG_VERSION 17.5
ENV ELIXIR_VERSION v1.0.4

ENV MIX_ENV test
ENV HOME root
ENV INSTALL_PATH $HOME/dependencies

ENV ERLANG_PATH $INSTALL_PATH/otp_src_$ERLANG_VERSION
ENV ELIXIR_PATH $INSTALL_PATH/elixir_$ELIXIR_VERSION
ENV DIALYZER_PATH $INSTALL_PATH/dialyxir"

ENV PATH $ERLANG_PATH/bin:$ELIXIR_PATH/bin:$PATH:$ERLANG_PATH/bin:$PATH
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

ADD . /root/$CIRCLE_PROJECT_REPONAME
WORKDIR /root/$CIRCLE_PROJECT_REPONAME

RUN \ 
    chmod 755 /root/$CIRCLE_PROJECT_REPONAME/scripts/ci/*.sh

RUN \ 
    /root/$CIRCLE_PROJECT_REPONAME/scripts/ci/prepare.sh && \
    /root/$CIRCLE_PROJECT_REPONAME/scripts/ci/build.sh
