# SSH/SCP tips

## SCP through SSH tunnel

Local <----> G(ateway) <----> R(emote)

We want to copy a file from our local machine, to R, but R is not directly
accessible from Local machine, but it is through G, and we can access G from
Local machine.


### Step 1: Tunnel setup

Let's open a terminal and setup the tunnel, two ways to do it:

 + This opens a shell on G:

```bash
ssh -L 1234:<address of R from G>:22 <user at G>@<address of G>
```

 + With `cat -` as remote command it just gets us connected.

```bash
ssh -L 1234:<address of R from G>:22 <user at G>@<address of G> cat -
```

### Step 2: Tunnel Use

Now on another terminal:

Run scp against port 1234 pretending 127.0.0.1 (localhost) is the remote
machine R, and the command will be sent to R.

```bash
scp -P 1234 <user at R>@127.0.0.1:/path/to/file [destfile]
```
