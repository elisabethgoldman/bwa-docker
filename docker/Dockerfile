FROM quay.io/jeremiahsavage/cdis_base

USER root
RUN apt-get update && apt-get install -y --force-yes \
    libpq-dev \
    make \
    s3cmd \
    wget


RUN apt-get clean \
    && rm -rf /var/lib/apt/lists/* /tmp/* /var/tmp/*


RUN apt-get clean \
    && rm -rf /var/lib/apt/lists/* /tmp/* /var/tmp/*

USER ubuntu

ENV HOME /home/ubuntu

RUN mkdir ${HOME}/tools

WORKDIR ${HOME}/tools/

# 2016-03-02
RUN wget https://github.com/lh3/bwa/releases/download/v0.7.13/bwa-0.7.13.tar.bz2 \
    && tar xf bwa-0.7.13.tar.bz2 \
    && cd bwa-0.7.13 \
    && make \
    && mkdir -p ${HOME}/.local/bin \
    && mv bwa ${HOME}/.local/bin \
    && cd ../ \
    && rm -rf bwa*

RUN wget https://github.com/samtools/samtools/releases/download/1.3/samtools-1.3.tar.bz2 \
    && tar xvf samtools-1.3.tar.bz2 \
    && cd samtools-1.3 \
    && ./configure --prefix=/home/ubuntu/.local \
    && make \
    && make install

ENV PATH ${HOME}/.local/bin:$PATH

WORKDIR ${HOME}

RUN pip install --user virtualenvwrapper \
    && /bin/bash -c "source ${HOME}/.local/bin/virtualenvwrapper.sh \
    && mkvirtualenv --python=/usr/bin/python3 p3 \
    && pip install --upgrade ipython pandas psycopg2 sqlalchemy \
    && echo source ${HOME}/.local/bin/virtualenvwrapper.sh >> ${HOME}/.bashrc \
    && echo source ${HOME}/.virtualenvs/p3/bin/activate >> ${HOME}/.bashrc"
