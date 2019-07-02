#!/bin/bash
# Create admin user

read -p "Enter username: " USER
echo "create user"
sudo adduser --gecos "" $USER
echo "add user to sudo group"
usermod -aG sudo $USER
echo "change user to newly created"
su - $USER
