FROM java:8-jre

#Install Logstash
RUN \ 
    cd /opt && \
    curl https://download.elasticsearch.org/logstash/logstash/logstash-1.4.2.tar.gz | tar zxv && \
    chown -R root:root /opt/logstash-1.4.2 && \
    /opt/logstash-1.4.2/bin/plugin install contrib && \
    mkdir -p /etc/logstash

COPY logstash.conf /etc/logstash/

COPY start.sh /opt/logstash-1.4.2/bin/

CMD /opt/logstash-1.4.2/bin/start.sh
