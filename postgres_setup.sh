#!/bin/bash

# Download / Install postgressql

EI="\e[1;32m"
EO="\e[0m"


desc="Installing postgres dependencies"
echo -e $EI $desc $EO
sudo apt install -y postgresql-client-common postgresql postgresql-contrib  postgresql-client-common


desc="Creating postgres user & database"
echo -e $EI $desc $EO
sudo -u postgres createuser -s $(whoami); createdb $(whoami)

#desc="Checking if postgres service is running"
#echo -e $EI $desc $EO
#ss -nlt |grep 5432

