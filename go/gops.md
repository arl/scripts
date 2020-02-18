# gops through ssh

For example:

    ssh -L 8080:localhost:8080 ec2-user@remote.server.ip

Then:

    gops memstats localhost:8080
    gops pprof-cpu localhost:8080
    gops pprof-heap localhost:8080
