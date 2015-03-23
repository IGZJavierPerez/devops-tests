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

Open a terminal and start a Ubuntu Client container

```bash
docker-compose up --no-recreate client
```

Open a terminal and start a Ubuntu Server container

```bash
docker-compose up --no-recreate server
```

Connect to the client container:

```bash
docker exec -it test_client_1 bash
```

Write some logs:

```bash
logger "Log test"
```

Now, you should see the Ubuntu Client container logs in Kibana dashboard.

## Troubleshooting

If something went wrong you can try to:

See the logs:

```bash
docker logs test_elasticseach_1
docker logs test_kibana_1
docker logs test_client_1
docker logs test_server_1
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