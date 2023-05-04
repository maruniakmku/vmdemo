#! /bin/bash

set -euo pipefail

# Update the system
sudo apt-get update
sudo apt-get -y dist-upgrade

# Install Python 3
sudo apt-get -y install python3 python3-dev python3-pip python3-pip python3-venv libpq-dev

# Create Python virtualenv
python3 -m venv ~/.venv/vmdemo
source ~/.venv/vmdemo/bin/activate

# Upgrade pip
python -m pip install -U pip

# Install pip packages
cd /vagrant/vmdemo
python -m pip install -r requirements.txt

# Bootstrap the DB
python3 manage.py migrate
python3 manage.py loaddata seed/demo.json

