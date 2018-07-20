# Pacman tips

## Maintenance

### List orphaned packages

    pacman -Qdtq


### List explicitely installed packages

    pacman -Qqet


## Query

### Search for packages in database (regex)

    pacman -Ss '^vim-'


### Search for already installed packages

    pacman -Qs pkgname


### Extended package information

Get package dependencies, packages that depends on, etc.
Add another i for more information.

    pacman -Si pkgname

## Build package from PKGBUILD

Get build essentials:

    sudo pacman -S kernel26-headers file base-devel abs

Get PKGBUILD file.

Make the package:

    makepkg -Acs

- `-A` to ignore target architecture
- `-c` cleans up the directory afterwards
- `-s` installs the needed dependencies

**IMPORTANT**:
do NOT run makepkg as root as it can cause permanent damage to your system. If
you really need to run it as root though, use the `--asroot` option.

Install the package.
makepkg should have create a file in the directory with the filetype
`.pkg.tar.xz`. Install this package by using the `-U` option with `pacman`.

    sudo pacman -U x.pkg.tar.xz


# Yaourt tips

yaourt -Syuua --noconfirm

Synchronize and update packages, with AUR support.
