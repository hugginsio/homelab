# pi_hole

## Check port 53

```shell
lsof -i :53
```

## Setup

Create an override for systemd's `resolved.conf`:

```shell
mkdir -p /etc/systemd/resolved.conf.d
```

```shell
vi /etc/systemd/resolved.conf.d/override.conf
```

```
[Resolve]
DNS=11.0.0.1
DNSStubListener=no
```
