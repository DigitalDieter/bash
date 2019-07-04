#!/bin/bash

# Generate ssh keypair for current user

EI="\e[1;32m"
EO="\e[0m"

desc="Generating  sshkeys (without password)"
echo -e $EI $desc $EO

if [ ! -d /home/$(whoami)/.ssh ]
then
    mkdir -p /home/$(whoami)/.ssh
    ssh-keygen -t ed25519 -o -a 100 -N "" -f /home/$(whoami)/.ssh/$(whoami).key
fi
