# Docker Logstash test

## Prerequisites

[Install Docker](https://docs.docker.com/installation/)
<br>
[Install Docker Compose] (http://docs.docker.com/compose/install/)
<br>
[Allow execute Docker without root access](https://docs.docker.com/installation/ubuntulinux/#giving-non-root-access)

## Prepare

```bash
git clone https://github.com/IGZJavierPerez/devops-tests.git
cd devops-tests/
git checkout  rsyslog+nagios
```

## Compile docker images

```bash
docker build -t thegameofcode/kibana kibana/
docker build -t thegameofcode/ubuntu ubuntu/
docker build -t thegameofcode/nagios nagios/
```

## Test

```
csd test
```

Open a terminal and start a Elasticsearch container

```bash
docker-compose up elasticsearch
```

Open a terminal and start a Kibana container

```bash
docker-compose up --no-recreate kibana
```

To check Kibana is working, open a browser and navigate to [http://localhost:5601/](http://localhost:5601/)

Open a terminal and start a Nagios container

```bash
docker-compose up --no-recreate nagios
```

Check Nagios is working (user=nagiosadmin password=nagios) [http://localhost:80/nagios](http://localhost:80/nagios).


Open a terminal and start a Ubuntu RSYSLOG Client container

```bash
docker-compose up --no-recreate client
```

This uses RSYSLOG to read the Nagios log and send it to a ZeroMQ queue

Open a terminal and start a Ubuntu RSYSLOG Server container

```bash
docker-compose up --no-recreate server
```

This uses RSYSLOG to read the ZeroMQ queue and send it to ElasticSearch

Now, you should see the Nagios logs in Kibana dashboard.

## Troubleshooting

If something went wrong you can try to:

See the logs:

```bash
docker logs test_elasticseach_1
docker logs test_kibana_1
docker logs test_server_1
docker logs test_client_1
docker logs test_nagios_1
```

Restart Docker service:

```bash
service docker restart
```

Remove Docker's containers:

```bash
docker rm -f $(docker ps -a -q)
```

Remove Docker's images and build again:

```bash
docker rmi thegameofcode/kibana thegameofcode/ubuntu thegameofcode/nagios
```