FROM ubuntu:16.04

LABEL maintainer Vish "vishvesh@litmusloop.com"

RUN apt-get update && apt-get install -y \
  build-essential autoconf libtool \
  pkg-config \
  automake \
  autogen \
  bash \
  bc \
  bzip2 \
  ca-certificates \
  curl \
  file \
  git \
  gzip \
  zip \
  make \
  ncurses-dev \
  python \
  python-pip \
  rsync \
  sed \
  bison \
  flex \
  tar \
  pax \
  vim \
  wget \
  runit \
  xz-utils && \
  apt-get clean --yes

RUN apt-get update && apt-get install -y \
  crossbuild-essential-armel gcc-arm-linux-gnueabi g++-arm-linux-gnueabi  && \
  apt-get clean --yes

ENV CROSS_TRIPLE arm-linux-gnueabi
ENV CROSS_ROOT /usr/bin
ENV AS=/usr/bin/${CROSS_TRIPLE}-as \
    AR=/usr/bin/${CROSS_TRIPLE}-ar \
    CC=/usr/bin/${CROSS_TRIPLE}-gcc \
    CPP=/usr/bin/${CROSS_TRIPLE}-cpp \
    CXX=/usr/bin/${CROSS_TRIPLE}-g++ \
    LDXX=/usr/bin/${CROSS_TRIPLE}-g++ \
    LD=/usr/bin/${CROSS_TRIPLE}-ld

RUN curl -o- https://raw.githubusercontent.com/creationix/nvm/v0.33.2/install.sh | bash

RUN export NVM_DIR=~/.nvm && /bin/bash ~/.nvm/nvm.sh

RUN /bin/bash nvm install v0.10.40 && /bin/bash nvm install v6.10.2
