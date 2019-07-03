#!/bin/bash

# Script to install Deep Learning Dependencies for ubuntu

# apt update
sudo apt  update

# apt upgrade
sudo apt -y upgrade

# install Dependencies
sudo apt install -y build-essential cmake g++ gfortran git pkg-config python-dev software-properties-common wget

# autoremove not used packages
sudo apt autoremove

# show firewall config
ufw app list


