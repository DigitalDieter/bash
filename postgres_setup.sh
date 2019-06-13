#!/usr/bin/env bash

sudo apt update
sudo sh -c 'echo "deb http://apt.postgresql.org/pub/repos/apt/ $(lsb_release -cs)-pgdg main" > /etc/apt/sources.list.d/pgdg.list'
sudo apt install wget ca-certificates
wget --quiet -O - https://www.postgresql.org/media/keys/ACCC4CF8.asc | sudo apt-key add -
sudo apt update
sudo apt install -y postgresql-10 pgadmin4
#check
sudo systemctl status postgresql.service
sudo -u postgres psql
\password postgres  (postgres)




sudo apt install -y postgresql postgresql-contrib  postgresql-client-common
sudo apt-get install postgresql-client





 sudo /etc/init.d/postgresql


export PGUSER=postgres
psql <<- EOSQL
    CREATE USER docker;
    CREATE DATABASE docker;
    GRANT ALL PRIVILEGES ON DATABASE docker TO docker;
EOSQL



#Check if postgres is running
ss -nlt |grep 5432



Unpacking postgresql-client (10+193) ...
Setting up libpq5:amd64 (10.8-0ubuntu0.18.10.1) ...
Processing triggers for libc-bin (2.28-0ubuntu1) ...
Setting up postgresql-client-10 (10.8-0ubuntu0.18.10.1) ...
update-alternatives: using /usr/share/postgresql/10/man/man1/psql.1.gz to provide /usr/share/man/man1/psql.1.gz (psql.1.gz) in auto mode
Setting up postgresql-client (10+193) ...