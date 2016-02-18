#!/bin/bash -v
yum update -y
yum install mysql -y

#Pre-requisite: Enable Google Cloud SQL API for service accounts
CLOUD_SQL_HOST=$(gcloud sql instances list --format=text | grep -i ipaddress | awk '{print $2}')
DB_NAME="..."
ROOT_USER="..."
ROOT_PASS="..."

BUCKET_NAME="..."

cd /
gsutil cp "gs://${BUCKET_NAME}/init.sql" .
mysql -h "$CLOUD_SQL_HOST" -u "$ROOT_USER" -D "$DB_NAME" --password="$ROOT_PASS" --prompt="${DB_NAME}> " < init.sql

