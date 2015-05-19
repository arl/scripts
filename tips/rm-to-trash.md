#Make rm move to trash, instead of deleting forever

First, install *trash-cli*, from the official repository :
```sudo apt-get install trash-cli```

And simply alias the ```rm``` command with ```trash-put``` : 
```alias rm='trash-put'```

It's working! File removed with ```rm``` go to trash and can still be restored if accidentaly deleted

**But there is still a problem with ```sudo rm```...**

Aliases are defined on a *per-user* basis, so ```sudo rm``` won't be expanded to ```sudo trash-put```.

...**To Solve it** we will use the following feature, described in the *alias bash builtin* page of the [Bash Manual](http://www.gnu.org/software/bash/manual/html_node/Aliases.html#Aliases) :
>If the last character of the alias value is a blank, then the next command word following the alias is also checked for alias expansion.

Now by doing this :
```alias sudo='sudo '``` *note the space before the last quote*
we get the possibility to have alias the command following sudo

This simple solution does the trick. Just add these 2 lines to your *.bashrc* :
```bash
alias rm="trash-put"
alias sudo="sudo "
```

**NB** : any file removed with ```sudo rm``` will be moved into the superuser (root) trashcan, not into your user's one.
To empty the super user trashcan or restore files from it you obviously need to be logged-in as superuser.

On Ubuntu 14.10, you can do
```gksu nautilus ~/.local/share/Trash/files```
to access the superuser trash folder

**One Last Thing**
If for a reason, you need to actually remove a file without moving it to the trash folder, you can precede ```rm``` with a backslash **\\** character, like this : 
```\rm```
This will temporarily disable *alias expansion* and run rm command