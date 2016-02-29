#!/bin/bash -v
yum update -y

INSTANCE_IPs=$(echo $(gcloud compute instances list --format=text | grep -i natip | awk '{print $2}') | sed 's/ /,/g')
HOME_IP="$1"
ALL_IPs="${INSTANCE_IPs},${HOME_IP}"
echo "$ALL_IPs"

#Pre-requisite: Enable Google Cloud SQL API for service accounts
SQL_INSTANCE_ID="$2"
gcloud sql instances patch "$SQL_INSTANCE_ID" --authorized-networks $ALL_IPs
