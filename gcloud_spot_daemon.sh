#!/usr/bin/env bash

# Use this daemon to watch your spot instances and send notifications when they
# are shut down.

DISCORD_WEBHOOK="configure_discord_webhook_uri"
MONITORED_INSTANCE_NAME="instance-1"

function check()
{
  gcloud compute instances list --filter="name=($MONITORED_INSTANCE_NAME)"
}

while true
do
  echo "$(date) Checking..."
  if check | grep TERMINATED; then
    curl -i -H "Accept: application/json" \
      -H "Content-Type:application/json" \
      -X POST \
      --data "{\"content\": $(check | jq -aRs .)}" \
      "$DISCORD_WEBHOOK"
    while check | grep TERMINATED
    do
      sleep 300;
    done
  fi
  sleep 300
done
