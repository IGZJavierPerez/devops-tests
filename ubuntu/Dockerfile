FROM dockerfile/ubuntu

RUN \
    sudo add-apt-repository ppa:adiscon/v8-stable && \
    sudo apt-get update && \
    sudo apt-get install -y rsyslog rsyslog-elasticsearch

CMD service rsyslog start && sleep 3 && tail -f /var/log/rsyslog.log