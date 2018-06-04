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
