FROM ubuntu:xenial-20161010

MAINTAINER Jeremiah H. Savage <jeremiahsavage@gmail.com>

RUN echo 'Acquire::http::Proxy "http://cloud-proxy:3128";' >> /etc/apt/apt.conf.d/01proxy \
    && echo 'Acquire::https::Proxy "http://cloud-proxy:3128";' >> /etc/apt/apt.conf.d/01proxy \
    && apt-get update \
    && apt-get install -y \
       bzip2 \
       gcc \
       libncurses5-dev \
       make \
       wget \
       zlib1g-dev \
    && apt-get clean \
    && export http_proxy=http://cloud-proxy:3128 \
    && export https_proxy=http://cloud-proxy:3128 \
    && wget https://github.com/jeremiahsavage/bwa/archive/gdc_a.tar.gz \
    && tar xf gdc_a.tar.gz \
    && cd bwa-gdc_a \
    && make \
    && mv bwa /usr/local/bin/ \
    && cd ../ \
    && rm -rf bwa* \
    && wget https://github.com/samtools/samtools/releases/download/1.3.1/samtools-1.3.1.tar.bz2 \
    && tar xvf samtools-1.3.1.tar.bz2 \
    && cd samtools-1.3.1 \
    && ./configure --prefix=/usr/local \
    && make \
    && make install
    && rm -rf samtools* \
    && rm -rf /var/lib/apt/lists/* /tmp/* /var/tmp/* \
    && rm -f /etc/apt/apt.conf.d/01proxy