# Docker-MLflow

This repo contains a very simple Docker container to easily run [MLflow](https://mlflow.org/).

## Build
1. To build from current directory
```
docker build -t mlflow .
```

2. To specify a Dockerfile

```
docker build - < mlflow.dockerfile -t mlflow
```

## Run
To run
```
docker run -p 5000:5000 mlflow
```

## Stop
1. To stop immediately
```
docker stop <containerId>
```
or after an allocated time, let's say 60s
```
docker stop -t 60 <containerId>
```

## Check
1. Check running containers
```
docker ps
```

2. Filter for container id given image name
```
docker ps -q --filter ancestor=mlflow
```

3. Chaining filtering and stopping
```
docker stop $(docker ps -q --filter ancestor=mlflow)
```
