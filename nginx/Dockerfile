FROM dockerfile/ubuntu

RUN \ 
    apt-get update && \
    apt-get install -y nginx

CMD bash -c "service rsyslog start && service nginx start && tail -f /var/log/nginx/error.log /var/log/nginx/access.log"