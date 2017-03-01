# Emulate network conditions with netem

Every command takes a verb (add/change/replace/delete)
# Packet loss

```
tc qdisc add dev eth0 root netem loss 0.1%
```

To reset to default conditions, delete the command:
```
tc qdisc delete dev eth0 root netem loss 0.1%
```

# Network delay

```
tc qdisc add dev eth0 root netem delay 100ms
```

You can add some random variation:
```
tc qdisc add dev eth0 root netem delay 100ms 10ms
```

# Packet duplication

```
tc qdisc change dev eth0 root netem duplicate 1%
```

# Many more things

- packet reordering
- rate control

See https://wiki.linuxfoundation.org/networking/netem and `man tc`

# Reset all rules at once

```
sudo tc qdisc del dev lo root
```
