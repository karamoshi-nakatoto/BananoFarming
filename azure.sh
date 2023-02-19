# shellcheck shell=bash
az vm create \
  --resource-group azure-4_group \
  --name azure-2 \
  --image UbuntuLTS \
  --admin-username azureuser \
  --size Standard_D4as_v5 \
  --ssh-key-values "$(cat ~/.ssh/id_rsa.pub)" \
  --public-ip-sku Standard
