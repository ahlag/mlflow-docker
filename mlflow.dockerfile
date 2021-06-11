FROM python:3.8.0

ENV AWS_ACCESS_KEY_ID ${AWS_ACCESS_KEY_ID}
ENV AWS_SECRET_ACCESS_KEY ${AWS_SECRET_ACCESS_KEY}

RUN pip install \
    mlflow \
    pymysql \
    boto3 \
    psycopg2

EXPOSE 5000 80

CMD mlflow ui \
	--host 0.0.0.0 \
	--port 5000 \
    --default-artifact-root s3://${BUCKET} \
    --backend-store-uri postgresql+psycopg2://${USERNAME}:${PASSWORD}@${HOST}:${PORT}/${DATABASE}
