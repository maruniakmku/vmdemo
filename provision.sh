#! /bin/bash

set -euo pipefail

# Install PostgreSQL 15
sudo sh -c 'echo "deb http://apt.postgresql.org/pub/repos/apt $(lsb_release -cs)-pgdg main" > /etc/apt/sources.list.d/pgdg.list'
wget --quiet -O - https://www.postgresql.org/media/keys/ACCC4CF8.asc | sudo apt-key add -
sudo apt-get update
sudo apt-get -y install postgresql-15 postgresql-client-15 libpq-dev

# Create the DB and its user
sudo -u postgres createdb vmdemo
sudo -u postgres psql -c "CREATE ROLE vmdemo WITH LOGIN PASSWORD 'vmdemo'"
sudo -u postgres psql -c "ALTER DATABASE vmdemo OWNER TO vmdemo"

# Install Python 3
sudo apt-get -y install python3 python3-dev python3-pip python3-pip python3-venv

# Create Python virtualenv
cd /vagrant/vmdemo
python3 -m venv .env
source .env/bin/activate

# Upgrade pip
python -m pip install -U pip

# Install pip packages
python -m pip install -r requirements.txt
