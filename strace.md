# strace

Trace open syscalls:

    strace -e trace=open,openat <command>

Include sub-processes/threads:


    strace -f -e trace=open,openat <command>
