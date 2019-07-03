#!/bin/bash

# Script Anaconda install script (install Installation Dependencies, install anaconda)

# Create admin user

#read -p "Enter username: " USER
echo "create anaconda user"

# create user without password for automated install
sudo adduser --disabled-password --gecos "" anaconda
#sudo adduser --gecos "" anaconda

echo "add anaconda user to sudo group"
sudo usermod -aG sudo anaconda
echo "change user to newly created"
sudo su - anaconda

#Updating the system
sudo apt update
sudo apt -y upgrade

#Dependencies installation (Jupyter )
sudo apt  install -y build-essential cmake g++ gfortran git pkg-config python-dev software-properties-common wget

#Removing old packages
sudo apt autoremove

if [ ! -d /home/anaconda/anaconda ]
then
    echo "Setting file/folder permissions"
    sudo chown -R anaconda:anaconda /home/anaconda
    sudo chmod -R go-w /home/anaconda
    echo "Downloading anaconda script intaller"
    curl -O https://repo.anaconda.com/archive/Anaconda3-2019.03-Linux-x86_64.sh
    echo "Install anaconda"
    installation_dir='/home/anaconda/anaconda'
    sudo -u anaconda sudo bash Anaconda3-2019.03-Linux-x86_64.sh -b -f -p ${installation_dir}
    echo "change user"
    su - anaconda
    echo "Execute conda info"
    conda info
fi
