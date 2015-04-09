FROM ubuntu:14.04

# Install.
RUN \
    sed -i 's/# \(.*multiverse$\)/\1/g' /etc/apt/sources.list && \
    apt-get update && \
    apt-get -y upgrade && \
    apt-get install -y build-essential && \
    apt-get install -y software-properties-common && \
    apt-get install -y byobu curl git htop man unzip vim wget && \
    rm -rf /var/lib/apt/lists/*

# Add files.
ADD root/.bashrc /root/.bashrc
ADD root/.gitconfig /root/.gitconfig
ADD root/.scripts /root/.scripts
ADD root/.profile /root/.profile

# Set environment variables.
ENV HOME /root

# Define working directory.
WORKDIR /root

RUN \
    sudo add-apt-repository ppa:adiscon/v8-stable && \
    sudo apt-get update && \
    sudo apt-get install -y pkg-config build-essential autoconf automake libjson0 libjson0-dev libestr0 libestr-dev zlibc zlib1g zlib1g-dev uuid-dev libgcrypt20-dev liblogging-stdlog1 liblogging-stdlog-dev liblognorm1 liblognorm1-dev

RUN \
    cd /opt && \
    curl http://download.zeromq.org/zeromq-3.2.5.tar.gz | tar zxv && \
    cd zeromq-3.2.5 && \
    ./configure && \
    make && \
    make install

RUN \
    cd /opt && \
    curl http://download.zeromq.org/czmq-2.2.0.tar.gz | tar zxv && \
    cd czmq-2.2.0 && \
    ./configure && \
    make && \
    make install

RUN \
    ldconfig

RUN \
    apt-get install -y libgcrypt11-dev libcurl4-gnutls-dev

RUN \
    cd /opt && \
    curl http://www.rsyslog.com/files/download/rsyslog/rsyslog-8.8.0.tar.gz | tar zxv && \
    cd rsyslog-8.8.0 && \
    ./configure --enable-omzmq3 --enable-imzmq3 --enable-elasticsearch --enable-imfile --enable-mmjsonparse --disable-generate-man-pages --prefix=/usr && \
    make && \
    make install

CMD service rsyslog start && touch /var/log/syslog && tail -f /var/log/syslog