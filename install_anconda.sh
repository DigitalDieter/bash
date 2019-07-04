#!/bin/bash

# Script Anaconda install script (install Installation Dependencies, install anaconda)

EI="\e[1;32m"
EO="\e[0m"


desc="Update package manager"
echo -e $EI $desc $EO
sudo apt update


desc="Installing software updates"
echo -e $EI $desc $EO
sudo apt -y upgrade


desc="Installing dependencies"
echo -e $EI $desc $EO
sudo apt install -y build-essential cmake g++ gfortran git pkg-config python-dev software-properties-common wget


desc="Removing old packages"
echo -e $EI $desc $EO
sudo apt autoremove


desc="Downloading anaconda install script"
echo -e $EI $desc $EO
curl -O https://repo.anaconda.com/archive/Anaconda3-2019.03-Linux-x86_64.sh


desc="Executing anaconda install script"
bash Anaconda3-2019.03-Linux-x86_64.sh
