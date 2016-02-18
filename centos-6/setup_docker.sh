#!/bin/bash -v
yum update -y
yum install epel-release -y
yum install docker-io -y
service docker start

cd /
BUCKET_NAME="..."
gsutil cp "gs://${BUCKET_NAME}/Dockerfile" .
docker build -t app-v1 .
docker run --name=app -p 8080:8080 -d app-v1

