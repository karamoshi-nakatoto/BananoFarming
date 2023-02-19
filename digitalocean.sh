# shellcheck shell=bash

# Make sure doctl is installed and you have generated an API token before
# running this script.

# You will receive the login credentials in an email.
doctl compute droplet create \
  --image ubuntu-20-04-x64 \
  --size s-1vcpu-1gb-amd \
  --region nyc1 \
  --wait \
  digitalocean-1

