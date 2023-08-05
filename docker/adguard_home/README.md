# [AdGuard Home](https://github.com/AdguardTeam/AdguardHome)

A DNS server for blocking ads & trackers.

## Troubleshooting

### Check port 53

```shell
sudo lsof -i :53
```

Create an override for systemd's `resolved.conf`:

```shell
sudo mkdir -p /etc/systemd/resolved.conf.d
```

```shell
sudo vi /etc/systemd/resolved.conf.d/override.conf
```

```
[Resolve]
DNS=127.0.0.1
DNSStubListener=no
```
