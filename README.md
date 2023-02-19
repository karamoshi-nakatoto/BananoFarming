# Banano farming scripts

### Create a wallet

Checkout https://bananominer.com/ for instructions to setup your folding address.

When you are ready, get your passkey [here](https://apps.foldingathome.org/getpasskey)

Copy the provided `.env.schema` template into a `.env` file and substiture your own values.

### Deployment

To deploy an Azure VM:

```shell
$ ./azure.sh
```

To deploy a Google Cloud Platform VM:

```shell
$ ./gcloud.sh
```

To automatically setup a VM:

```shell
$ ssh vm bash < setup.sh
```
