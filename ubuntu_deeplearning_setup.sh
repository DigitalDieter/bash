#!/bin/bash

sudo apt  update
sudo apt -y upgrade
sudo apt install -y build-essential cmake g++ gfortran git pkg-config python-dev software-properties-common wget
sudo apt -y autoremove


ufw app list



#################    ANACONDA  #################
#echo "Create user anaconda"

#sudo adduser anaconda --disabled-password --shell /bin/bash --gecos "User" $username
#adduser anaconda --disabled-password --shell /bin/bash --gecos "sudo" $username



