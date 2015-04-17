

#make rm move to Trash instead of deleting forever

First, install *trash-cli*, from the official ubuntu repository
```sudo apt-get install trash-cli
 ```

Then set an alias for rm : 
 ```alias rm='trash-put'```

So It's working perfectly, rm'd files go under Trash and can be restored

**problem** : if you do
```sudo rm```
the ```rm``` cmd won't be aliased into  ```trash-put``` because aliases are created on a per-user basis

It's possible to do this : 
```alias sudo='sudo '```
*note the space before the last quote*

This simple solution does the trick. 

Now, when doing ```sudo rm``` we are in fact doing ```sudo trash-put```

From Bash manual : 
>If the last character of the alias value is a space or tab character, then the next command word following the alias is also checked for alias expansion.

NB : obviously any files or folders placed to Trash using ```sudo``` will be placed on the superuser (root) Trash. To empty the trash or restore them you need to be logged-in a the superuser and know the location of the superuser Trash folder.

For instance, on Ubuntu 14.10, you can do
```gksu nautilus ~/.local/share/Trash/files```
to access them


