# Bootstrap

## Requirements

TODO

## Installing Ubuntu Server

TODO

## Installing Docker

TODO

## Installling Additional Packages

Required:

- `git`
- `jq`

Recommended:

- `tailscale`

## Downloading Repository

You will want to clone the repository locally to ease setting up Portainer. The following command will clone the Homelab repository into a directory in your user folder called `homelab-remote`:

```shell
git clone git@github.com:hugginsio/homelab.git $HOME/homelab-remote
```

Some of the Docker Compose files defined in this repository expect to find configuration files in that directory by default.

## Starting Portainer

In your terminal, enter the `homelab-remote` directory:

```shell
cd $HOME/homelab-remote
```

Before we can start Portainer, there is a script that will help us generate the environment details expected by the Compose file. Give this file execute permissions and then run the script with the following commands:

```shell
chmod +x ./genenv.sh
./genenv.sh
```

If you have Tailscale and `jq` installed, you should see output similar to this:

```
USERNAME=hubot
DOCKER_HOST=primary
DOMAIN_NAME=primary.boot-strap.ts.net
```
