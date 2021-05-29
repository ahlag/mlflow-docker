FROM python:3.8.0

RUN pip install \
    mlflow \
    pymysql \
    boto3

EXPOSE 5000

MAINTAINER "CYLIK"

CMD mlflow ui \
	--host 0.0.0.0 \
	--port 5000
