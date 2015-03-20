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
git checkout nginx+rsyslog+logstash
```

## Compile docker images

```bash
docker build -t thegameofcode/kibana kibana/
docker build -t thegameofcode/ubuntu ubuntu/
```

## Test

```
cd test
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

Open a terminal and start a Ubuntu container

```bash
docker-compose up --no-recreate ubuntu
```

Now, you see the Ubuntu container logs in Kibana dashboard.

## Troubleshooting

If something went wrong you can try to:

See the logs:

```bash
docker logs test_elasticseach_1
docker logs test_kibana_1
docker logs test_ubuntu_1
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
docker rmi thegameofcode/kibana thegameofcode/ubuntu
```