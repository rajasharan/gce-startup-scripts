#!/bin/bash -v
yum update -y

INSTANCE_IPs=$(gcloud compute instances list --format=text | grep -i natip | awk '{print $2}' | sed 'N;s/\n/,/')
HOME_IP="x.x.x.x"
ALL_IPs="${INSTANCE_IPs},${HOME_IP}"
echo "$ALL_IPs"

#Pre-requisite: Enable Google Cloud SQL API for service accounts
PROJECT_NAME="..."
gcloud sql instances patch "$PROJECT_NAME" --authorized-networks $ALL_IPs
