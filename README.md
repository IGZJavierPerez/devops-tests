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
docker build -t thegameofcode/logstash logstash/
docker build -t thegameofcode/nginx nginx/
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

Open a terminal and start a Logstash container

```bash
docker-compose up --no-recreate logstash
```

Open a terminal and start a NGiNX container

```bash
docker-compose up --no-recreate nginx
```

Now, you should navigate to [http://localhost:80](http://localhost:80) and see the NGiNX in Kibana.

## Real implementation

You can change the [Logstash server configuration](https://github.com/IGZJavierPerez/devops-tests/blob/logstash/test/logstash/logstash.conf) or the [NGiNX](https://github.com/IGZJavierPerez/devops-tests/blob/beaver/test/nginx/nginx.conf) files. You can change them before the image compilation or you can pass a customized configuration file during the container creation. You need to update NGiNX `volumes` section of the [docker-compose.yml](https://github.com/IGZJavierPerez/devops-tests/blob/logstash/test/docker-compose.yml) file to make accessible NGiNX logs to the Docker container.

## Troubleshooting

If something went wrong you can try to:

See the logs:

```bash
docker logs test_elasticseach_1
docker logs test_kibana_1
docker logs test_logstash_1
docker logs test_nginx_1
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
docker rmi thegameofcode/logstash thegameofcode/kibana thegameofcode/nginx
```