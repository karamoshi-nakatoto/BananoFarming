# shellcheck shell=bash

gcloud beta compute instances create instance-1 \
    --provisioning-model=SPOT \
    --instance-termination-action=STOP \
    --image-family=debian-10 \
    --image-project=debian-cloud \
    --metadata=ssh-keys=karamoshi:"$(cat ~/.ssh/id_rsa.pub)" \
    --machine-type=e2-highcpu-4 \
    --zone=us-central1-c
