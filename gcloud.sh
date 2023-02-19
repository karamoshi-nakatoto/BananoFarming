# shellcheck shell=bash

# This script creates a free-tier compatible VM with your credentials

# Add these arguments for spot instances:
#     --provisioning-model=SPOT \
#     --instance-termination-action=STOP \
gcloud beta compute instances create instance-1 \
    --image-family=debian-10 \
    --image-project=debian-cloud \
    --metadata=ssh-keys="$(whoami):$(cat ~/.ssh/id_rsa.pub)" \
    --machine-type=e2-micro \
    --zone=us-central1-a
