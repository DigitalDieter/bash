#!/usr/bin bash
echo "Generating  sshkeys (without password)"
if [ ! -d /opt/anaconda ]
then
    echo "Create folder for installation"
    mkdir -p /opt/anaconda
    echo "Downloading anaconda script intaller"
    curl -O https://repo.anaconda.com/archive/Anaconda3-2019.03-Linux-x86_64.sh
    echo "Install anaconda"
    installation_dir='/opt/anaconda'
    bash Anaconda3-2019.03-Linux-x86_64.sh -b -f -p ${installation_dir}
    su anaconda
    conda info
fi

