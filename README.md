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
git checkout logstash
```

## Compile docker images

```bash
docker build -t thegameofcode/kibana kibana/
docker build -t thegameofcode/logstash logstash/
docker build -t thegameofcode/beaver beaver/
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

Open a terminal and start a RabbitMQ container

```bash
docker-compose up rabbitmq
```

Open a terminal and start a Logstash container

```bash
docker-compose up --no-recreate logstash
```

Open a terminal and start a Beaver container

```bash
docker-compose up --no-recreate beaver
```

Now, you should see in Kibana the logs of the file `/var/log/syslog`

## Real implementation

You can change the [Logstash server configuration](https://github.com/IGZJavierPerez/devops-tests/blob/logstash/test/logstash/logstash.conf) or the [Beaver](https://github.com/IGZJavierPerez/devops-tests/blob/beaver/test/beaver/beaver.conf) files. You can change them before the image compilation or you can pass a customized configuration file during the container creation. You need to update Beaver `volumes` section of the [docker-compose.yml](https://github.com/IGZJavierPerez/devops-tests/blob/logstash/test/docker-compose.yml) file to make accessible the configured logs of the host to the Docker container.

## Troubleshooting

If something went wrong you can try to:

See the logs:

```bash
docker logs elasticseach
docker logs kibana
docker logs rabbitmq
docker logs logstash
docker logs beaver
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
docker rmi thegameofcode/logstash thegameofcode/kibana thegameofcode/beaver
```