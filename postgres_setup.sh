#!/bin/bash

# Download / Install postgressql 

echo"Download and Setup a postgres db"
# Install dependencies
sudo apt install-y postgresql-client-common postgresql postgresql-contrib  postgresql-client-common
# Create user and database
sudo -u postgres createuser -s $(whoami); createdb $(whoami)
# Test login
# check if service is online
ss -nlt |grep 5432
#sudo -u postgres psql
