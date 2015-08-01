#! /bin/bash
# sudo apt-get install keychain
# keychain is an ssh-agent
# enter your passphrase 
keychain id_rsa_github id_rsa_bitbucket
[ -z "$HOSTNAME" ] && HOSTNAME=`uname -n`
[ -f $HOME/.keychain/$HOSTNAME-sh ] && \
	   . $HOME/.keychain/$HOSTNAME-sh

# vim: set ts=2 sw=2 sts=2 et sta:
