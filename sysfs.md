# Nicely list all properties in a sysfs directory

    grep -s "" /sys/class/foo/bar/*

`-s` to silent warnings about directories

Example:
```
$ grep -s "" /sys/class/net/eth0/*
/sys/class/net/eth0/addr_assign_type:0
/sys/class/net/eth0/addr_len:6
/sys/class/net/eth0/address:50:eb:f6:74:06:17
/sys/class/net/eth0/broadcast:ff:ff:ff:ff:ff:ff
/sys/class/net/eth0/carrier:1
/sys/class/net/eth0/carrier_changes:2
/sys/class/net/eth0/dev_id:0x0
/sys/class/net/eth0/dev_port:0
/sys/class/net/eth0/dormant:0
/sys/class/net/eth0/duplex:full
/sys/class/net/eth0/flags:0x1003
/sys/class/net/eth0/gro_flush_timeout:0
/sys/class/net/eth0/ifindex:3
/sys/class/net/eth0/iflink:3
/sys/class/net/eth0/link_mode:0
/sys/class/net/eth0/mtu:1500
/sys/class/net/eth0/netdev_group:0
/sys/class/net/eth0/operstate:up
/sys/class/net/eth0/proto_down:0
/sys/class/net/eth0/speed:100
/sys/class/net/eth0/tx_queue_len:1000
/sys/class/net/eth0/type:1
/sys/class/net/eth0/uevent:INTERFACE=eth0
/sys/class/net/eth0/uevent:IFINDEX=3
```