# [kv2](https://github.com/hugginsio/kv2)

Encrypted secrets management for the homelab.

```sh
docker run --detach --restart unless-stopped --log-driver local --log-opt max-file=3 --log-opt max-size=5m -v kv2db:/root/.config/kv2/ -e KV2_PRIVATE_KEY=gsm://projects/REPLACEME/secrets/kv2-private-key -e KV2_PUBLIC_KEY=gsm://projects/REPLACEME/secrets/kv2-public-key -e KV2_TS_AUTHKEY=gsm://projects/REPLACEME/secrets/ts-authkey -e KV2_CLOUD_STORAGE=gcs://kv2-backup -e KV2_NO_TLS=true ghcr.io/hugginsio/kv2:v0.11.6
```
