# DEMO: Using Virtual Machines for development

## How to run the app
1. Install [VirtualBox](https://www.virtualbox.org/)
2. install [Vagrant](https://developer.hashicorp.com/vagrant)
3. Run `vagrant up --provision`
4. Run `vagrant ssh -c "cd /vagrant/vmdemo && .env/bin/python3 manage.py migrate"`
5. Run `vagrant ssh -c "cd /vagrant/vmdemo && .env/bin/python3 manage.py loaddata seed/demo.json"`
6. Run `vagrant ssh -c "cd /vagrant/vmdemo && .env/bin/python3 manage.py runserver 0.0.0.0:8000"`
7. Open http://127.0.0.1:8000/admin (user: admin, password: admin)

## How to access the DB
Run `vagrant ssh -c "psql -U vmdemo -h 127.0.0.1 -d vmdemo"` (password: vmdemo)
