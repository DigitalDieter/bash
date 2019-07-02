
# Generate ssh keypair for current user

echo "Generating  sshkeys (without password)"
if [ ! -d /home/$(whoami)/.ssh ]
then
    mkdir -p /home/$(whoami)/.ssh
    ssh-keygen -t ed25519 -o -a 100 -N "" -f /home/$(whoami)/.ssh/$(whoami).key
fi
