FROM ubuntu:bionic-20180426

MAINTAINER Jeremiah H. Savage <jeremiahsavage@gmail.com>

RUN apt-get update \
    && apt-get install -y \
       bzip2 \
       gcc \
       libbz2-dev \
       liblzma-dev \
       libncurses5-dev \
       make \
       wget \
       zlib1g-dev \
    && apt-get clean \
    && wget https://github.com/lh3/bwa/releases/download/v0.7.15/bwa-0.7.15.tar.bz2 \
    && tar xf bwa-0.7.15.tar.bz2 \
    && cd bwa-0.7.15 \
    && make \
    && mv bwa /usr/local/bin/ \
    && cd ../ \
    && rm -rf bwa* \
    && wget https://github.com/samtools/samtools/releases/download/1.8/samtools-1.8.tar.bz2 \
    && tar xf samtools-1.8.tar.bz2 \
    && cd samtools-1.8 \
    && ./configure --prefix=/usr/local \
    && make \
    && make install \
    && cd ../ \
    && rm -rf samtools-1.8 \
    && rm -rf /var/lib/apt/lists/* /tmp/* /var/tmp/*
