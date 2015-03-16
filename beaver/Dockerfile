FROM dockerfile/ubuntu

RUN \ 
    apt-get update && \
    apt-get install -y python-pip && \
    pip install beaver

COPY beaver.conf /etc/beaver/

CMD beaver -c /etc/beaver/beaver.conf -t rabbitmq