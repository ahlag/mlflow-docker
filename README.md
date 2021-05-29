# Docker-MLflow

This repo contains a very simple Docker container to easily run [MLflow](https://mlflow.org/).

## Build
1. To build from current directory
```
docker build -t mlflow .
```

2. To specify a Dockerfile

```
docker build -t mlflow .
```

## Run
To run
```
docker run -p 5000:5000 mlflow
```
