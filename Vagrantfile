# -*- mode: ruby -*-
# vi: set ft=ruby :

Vagrant.configure("2") do |config|
  config.vm.define "db" do |db|
    db.vm.box = "ubuntu/jammy64"
    db.vm.network "private_network", ip: "192.168.56.10"
    db.vm.provider "virtualbox" do |vb|
      vb.memory = "512"
      vb.cpus = 1
      vb.name = "vmdemo-db"
    end
    db.vm.provision "shell", path: "provision/setup-db.sh", privileged: false
  end

  config.vm.define "web" do |web|
    web.vm.box = "ubuntu/jammy64"
    web.vm.network "private_network", ip: "192.168.56.20"
    web.vm.network "forwarded_port", guest: 8000, host: 8000, host_ip: "127.0.0.1"
    web.vm.provider "virtualbox" do |vb|
      vb.memory = "512"
      vb.cpus = 1
      vb.name = "vmdemo-web"
    end
    web.vm.provision "shell", path: "provision/setup-web.sh", privileged: false
  end
end
