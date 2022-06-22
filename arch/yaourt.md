# Yaourt tips


## Maintenance

Synchronize and update packages, with AUR support:

	yaourt -Syuua --noconfirm


To update an AUR (yaourt) installed package, you have to use the following:

    yaourt -Syua

|       option       |                    detail
-------------------- |-------------------------------------------------------
`−S`, `−−sync`       | Synchronize packages + AUR support, building from sources.
`-u`, `--sysupgrade` | Upgrade all packages that are out of date.
`−a`, `−−aur`        | Also search in AUR database. With `−u` or `−−sysupgrade`, upgrade aur packages that are out of date. With `−Qm`, display more info about foreign package.
`-y`, `--refresh`    | Download a fresh copy of the master package database.

