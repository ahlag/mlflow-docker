#!/bin/bash -x

exec mlflow ui \
	--host 0.0.0.0 \
	--port 5000 \
    --default-artifact-root s3://${BUCKET} \
    --backend-store-uri postgresql+psycopg2://${USERNAME}:${PASSWORD}@${HOST}:${PORT}/${DATABASE}
