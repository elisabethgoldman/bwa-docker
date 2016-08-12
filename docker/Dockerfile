FROM ubuntu:xenial-20160809

MAINTAINER Jeremiah H. Savage <jeremiahsavage@gmail.com>

RUN apt-get update \
    && apt-get install -y \
       bzip2 \
       gcc \
       libncurses5-dev \
       make \
       wget \
       zlib1g-dev \
    && apt-get clean \
    && rm -rf /var/lib/apt/lists/* /tmp/* /var/tmp/* \
    && wget https://github.com/lh3/bwa/releases/download/v0.7.15/bwa-0.7.15.tar.bz2 \
    && tar xf bwa-0.7.15.tar.bz2 \
    && cd bwa-0.7.15 \
    && make \
    && mv bwa /usr/local/bin/ \
    && cd ../ \
    && rm -rf bwa* \
    && wget https://github.com/samtools/samtools/releases/download/1.3.1/samtools-1.3.1.tar.bz2 \
    && tar xvf samtools-1.3.1.tar.bz2 \
    && cd samtools-1.3.1 \
    && ./configure \
    && make \
    && make install