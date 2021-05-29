# Docker-MLflow

This repo contains a very simple Docker container to easily run [MLflow](https://mlflow.org/).

## Docker

### Build
1. To build from current directory
```
docker build -t mlflow .
```

2. To specify a Dockerfile

```
docker build - < mlflow.dockerfile -t mlflow
```

### Run
To run
```
docker run -p 5000:5000 mlflow
```

### Stop
To stop immediately
```
docker stop <containerId>
```
or after an allocated time, let's say 60s
```
docker stop -t 60 <containerId>
```

### Check
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

4. To check for docker images
```
docker images
```

## Amwazon ECR

### Checking
1. Check ECR repositories
```
aws ecr describe-repositories --region ap-northeast-1
```

### Push Docker Image

1. Login to AWS ECR
```
aws ecr get-login-password --region ap-northeast-1 | docker login --username AWS --password-stdin $HOSTNAME
```

If you see Login Succeeded, you're good to go.

2. Tag the image that will be pushed to ECR
```
docker tag <IMAGE ID> $HOSTNAME/$REPOSITORY_NAME:latest
```

3. Push the tagged docker image to ECR
Note: Please don't forget the repository name.
```
docker push $HOSTNAME/$REPOSITORY_NAME:latest
```
