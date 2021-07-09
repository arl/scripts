# Gnome tracker service

I noted by tailing on syslog when copying old DVD with an external drive that
each time the tracker service triggered (every N seconds), my ffmpeg command to
copy the DVD content to a file halted. That was greatly slowing down the whole
copy process.

Temporarily disabling all 4 tracker-* systemd services solved the problem.

    systemctl --user status tracker-extract.service tracker-miner-fs.service tracker-store.service tracker-writeback.service

    systemctl --user disable tracker-extract.service tracker-miner-fs.service tracker-store.service tracker-writeback.service

source: https://www.linuxuprising.com/2019/07/how-to-completely-disable-tracker.html
