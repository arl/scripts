# Add a route for multicast traffic to a an interface

Let enp0s31f6 be the iface name.

    route add -net 224.0.0.0 netmask 224.0.0.0 enp0s31f6
