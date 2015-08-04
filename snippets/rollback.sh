#! /bin/bash

rollback() {
   del_from_passwd $user
   if [ -e /home/$user ]; then
      rm -rf /home/$user
   fi
   exit
}

trap rollback INT TERM EXIT
add_to_passwd $user
cp -a /etc/skel /home/$user
chown $user /home/$user -R
trap - INT TERM EXIT
