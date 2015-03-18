FROM java:8-jre

#Install Logstash
RUN \ 
    cd /opt && \
    curl https://download.elasticsearch.org/logstash/logstash/logstash-1.4.2.tar.gz | tar zxv && \
    chown -R root:root /opt/logstash-1.4.2 && \
    /opt/logstash-1.4.2/bin/plugin install contrib && \
    mkdir -p /etc/logstash

#Install ZeroMQ
RUN apt-get update
RUN apt-get install -y libtool pkg-config build-essential autoconf automake
RUN apt-get install -y uuid-dev

RUN \ 
    cd /opt && \
    curl http://download.zeromq.org/zeromq-2.1.11.tar.gz | tar zxv && \
    cd  zeromq-2.1.11 && \
    ./configure && \
    make && \
    make install && \
    ldconfig

COPY logstash.conf /etc/logstash/

COPY start.sh /opt/logstash-1.4.2/bin/

CMD /opt/logstash-1.4.2/bin/start.sh
