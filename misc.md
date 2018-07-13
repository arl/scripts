# Read-only NTFS-formatted disk

Some kernel logs:

```
Jul 14 00:39:13 thinkpad kernel: ntfs: driver 2.1.32 [Flags: R/W MODULE].
Jul 14 00:39:13 thinkpad kernel: ntfs: volume version 3.1.
Jul 14 00:39:13 thinkpad kernel: ntfs: (device sdb1): load_system_files(): Volume is dirty.  Mounting read-only.  Run chkdsk and mount in Windows.
```

    sudo ntfsfix /dev/sdb1

`ntfsfix` is to be found in `ntfs-3g` package.
