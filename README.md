# jenkins-install
A baseline install for Jenkins using Docker. Nothing fancy yet.

# Installation
## Build the Dockerfile
```
docker build -t jenkins-bo:2.403-1 .
```

## Create a Jenkins network
```
docker network create jenkins
```

## Spin up the Container
### Linux & MacOS
```
docker run \
  --name jenkins-bo \
  --restart=on-failure \
  --detach \
  --network jenkins \
  --env DOCKER_HOST=tcp://docker:2376 \
  --env DOCKER_CERT_PATH=/certs/client \
  --env DOCKER_TLS_VERIFY=1 \
  --publish 8080:8080 \
  --publish 50000:50000 \
  --volume jenkins-data:/var/jenkins_home \
  --volume jenkins-docker-certs:/certs/client:ro \
  jenkins-bo:2.403-1
```

### Windows
```
docker run `
  --name jenkins-bo `
  --restart=on-failure `
  --detach `
  --network jenkins `
  --env DOCKER_HOST=tcp://docker:2376 `
  --env DOCKER_CERT_PATH=/certs/client `
  --env DOCKER_TLS_VERIFY=1 `
  --volume jenkins-data:/var/jenkins_home `
  --volume jenkins-docker-certs:/certs/client:ro `
  --publish 8080:8080 `
  --publish 50000:50000 `
  jenkins-bo:2.403-1
```

## Get the keys to the kingdom
```
docker exec jenkins-bo cat /var/jenkins_home/secrets/initialAdminPassword
```

## Connect to Jenkins
```
https://localhost:8080/
```
