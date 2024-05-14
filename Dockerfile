
FROM ubuntu:22.04

WORKDIR /home
ENV HOME /home

SHELL ["/bin/bash", "-c"]
ENV DEBIAN_FRONTEND noninteractive

# setup timezone
RUN echo 'Asia/Tokyo' > /etc/timezone && \
    ln -s /usr/share/zoneinfo/Asia/Tokyo /etc/localtime && \
    apt-get update && DEBIAN_FRONTEND=noninteractive && \
    apt-get install -q -y --no-install-recommends \
        tzdata && \
    apt-get clean && rm -rf /var/lib/apt/lists/*

# setup environment
ENV LANG en_US.UTF-8
ENV LC_ALL en_US.UTF-8

# locale
RUN apt-get update && DEBIAN_FRONTEND=noninteractive && \
    apt-get install -q -y --no-install-recommends \
        locales && \
    apt-get clean && rm -rf /var/lib/apt/lists/*
RUN locale-gen en_US.UTF-8

# install basic packages
RUN apt-get update && apt-get install -y --no-install-recommends \
        sudo \
        lsb-release \
        less \
        git \
        vim \
        wget \
        build-essential \
        libpq-dev \
        libffi-dev \
        libssl-dev \
        zlib1g-dev \
        liblzma-dev \
        libbz2-dev \
        libreadline-dev \
        libsqlite3-dev \
        libopencv-dev \
        tk-dev \
        ca-certificates && \
    update-ca-certificates && \
    sudo apt-get clean && \
    sudo rm -rf /var/lib/apt/lists/*

# install pyenv
RUN git clone https://github.com/pyenv/pyenv.git /home/.pyenv
COPY config/.bashrc /home/.bashrc
ENV PATH="/home/.pyenv/bin:$PATH"
RUN eval "$(pyenv init --path)" && \
    pyenv install 3.11.0 && \
    pyenv global 3.11.0

# install index_pdf
RUN git clone https://github.com/Mega-Gorilla/Index_PDF_Translation.git

RUN cd Index_PDF_Translation && \
    eval "$(pyenv init --path)" && \
    pip install -r requirements.txt

COPY config/config.py /home/Index_PDF_Translation/config.py

CMD ["bash"]