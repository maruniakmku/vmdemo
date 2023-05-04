#! /bin/bash

set -euo pipefail

# Install PostgreSQL 15
sudo sh -c 'echo "deb http://apt.postgresql.org/pub/repos/apt $(lsb_release -cs)-pgdg main" > /etc/apt/sources.list.d/pgdg.list'
wget --quiet -O - https://www.postgresql.org/media/keys/ACCC4CF8.asc | sudo apt-key add -
sudo apt-get update
sudo apt-get -y dist-upgrade
sudo apt-get -y install postgresql-15 postgresql-client-15 libpq-dev

# Create the DB and its user
sudo -u postgres createdb vmdemo
sudo -u postgres psql -c "CREATE ROLE vmdemo WITH LOGIN PASSWORD 'vmdemo'"
sudo -u postgres psql -c "ALTER DATABASE vmdemo OWNER TO vmdemo"

# Make PostgreSQL listen on all IPs and allow connections from any IP
cat <<EOF | sudo tee -a /etc/postgresql/15/main/postgresql.conf
listen_addresses = '*'
EOF

cat <<EOF | sudo tee -a /etc/postgresql/15/main/pg_hba.conf
host    all             all             0.0.0.0/0            md5
EOF

sudo service postgresql restart

