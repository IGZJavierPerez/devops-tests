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
	apt-get update && \
	apt-get install -y apache2 libapache2-mod-php5

RUN \
	apt-get install -y libgd2-xpm-dev

RUN \
	/usr/sbin/useradd -m -s /bin/bash nagios && \
	/usr/sbin/groupadd nagcmd && \
	/usr/sbin/usermod -a -G nagcmd nagios && \
	/usr/sbin/usermod -a -G nagcmd www-data

RUN \
    cd /opt && \
    curl http://softlayer-ams.dl.sourceforge.net/project/nagios/nagios-4.x/nagios-4.0.8/nagios-4.0.8.tar.gz | tar zxv && \
    cd nagios-4.0.8 && \
    ./configure --with-command-group=nagcmd && \
    make all && \
    make install && \
    make install-init && \
    make install-config && \
    make install-commandmode

RUN \
	/usr/bin/install -c -m 644 /opt/nagios-4.0.8/sample-config/httpd.conf /etc/apache2/sites-enabled/nagios.conf

RUN \
    cd /opt && \
    curl  http://nagios-plugins.org/download/nagios-plugins-2.0.3.tar.gz | tar zxv && \
    cd nagios-plugins-2.0.3 && \
    ./configure --with-nagios-user=nagios --with-nagios-group=nagios && \
    make && \
    make install

 RUN  \
 	apt-get install apache2-utils
 	
 RUN \
  a2enmod cgi

CMD service apache2 start && service nagios start && touch /usr/local/nagios/var/nagios.log && tail -f /usr/local/nagios/var/nagios.log