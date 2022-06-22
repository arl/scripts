# TCP
## Show current http connections

With [netcat](netcat.md)
```
netstat | grep http | grep 77.95.143.196
```

## Redirect any TCP port to port 80

This has to be the easiest way to install a redirection from port 80 to any
other local port. This is so useful for development.

```
socat TCP-LISTEN:80,fork TCP:127.0.0.1:7070
```

## tcpdump

Dump http traffic to and from MYHOST, on port 80:
 - `i` interface
 - `-s 65535` keep whole packets (65535 bytes) instead of truncating them to
    262144 (the default).
 - `-w output.pcap` writes to file instead of standard output.

```
tcpdump -i wlp58s0 -s 65535 -w output.pcap 'host MYHOST and (tcp port 80)'
```

## IpTables

Add an IpTables rule that reject every TCP packet to 127.0.0.1:40000:

    sudo iptables -A INPUT -d 127.0.0.1 -p tcp --dport 40000 -j REJECT

Remove the previous rule (note the `-D` instead of `-A`):

    sudo iptables -D INPUT -d 127.0.0.1 -p tcp --dport 40000 -j REJECT


## Show which process is using a specific port

    sudo ss -lptn 'sport = :80'
