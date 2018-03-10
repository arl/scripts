# Show current http connections (with a specific host or no)

```
netstat | grep http | grep 77.95.143.196
```

# Redirect any TCP port to port 80

This has to be the easiest way to install a redirection from port 80 to any
other local port. This is so useful for development.

```
socat TCP-LISTEN:80,fork TCP:127.0.0.1:7070
```
