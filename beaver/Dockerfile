FROM dockerfile/ubuntu

RUN \ 
    apt-get update && \
    apt-get install -y python-pip && \
    pip install beaver && \
	apt-get install -y python-dev libzmq-dev && \
	pip install pyzmq==2.1.11


COPY beaver.conf /etc/beaver/

CMD beaver -c /etc/beaver/beaver.conf -t zmq