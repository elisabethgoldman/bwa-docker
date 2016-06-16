FROM quay.io/jeremiahsavage/cdis_base

USER root

RUN apt-get update && apt-get install -y --force-yes \
    libncurses5-dev \
    make \
    wget

RUN apt-get clean \
    && rm -rf /var/lib/apt/lists/* /tmp/* /var/tmp/*

USER ubuntu

ENV HOME /home/ubuntu

RUN mkdir ${HOME}/tools

WORKDIR ${HOME}/tools/

# 2016-06-09
RUN wget https://github.com/lh3/bwa/releases/download/v0.7.15/bwa-0.7.15.tar.bz2 \
    && tar xf bwa-0.7.15.tar.bz2 \
    && cd bwa-0.7.15 \
    && make \
    && mkdir -p ${HOME}/.local/bin \
    && mv bwa ${HOME}/.local/bin \
    && cd ../ \
    && rm -rf bwa*

RUN wget https://github.com/samtools/samtools/releases/download/1.3.1/samtools-1.3.1.tar.bz2 \
    && tar xvf samtools-1.3.1.tar.bz2 \
    && cd samtools-1.3.1 \
    && ./configure --prefix=/home/ubuntu/.local \
    && make \
    && make install

ENV PATH ${HOME}/.local/bin:$PATH

WORKDIR ${HOME}

RUN pip install --user virtualenvwrapper \
    && /bin/bash -c "source /usr/share/virtualenvwrapper/virtualenvwrapper.sh \
    && mkvirtualenv --python=/usr/bin/python3 p3 \
    && pip install --upgrade pip \
    && pip install --upgrade ipython pandas sqlalchemy \
    && echo source /usr/share/virtualenvwrapper/virtualenvwrapper.sh >> ${HOME}/.bashrc \
    && echo source ${HOME}/.virtualenvs/p3/bin/activate >> ${HOME}/.bashrc"
