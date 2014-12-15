# -*- mode: ruby -*-
# vi: set ft=ruby :

# Vagrantfile API/syntax version. Don't touch unless you know what you're doing!
VAGRANTFILE_API_VERSION = "2"

Vagrant.configure(VAGRANTFILE_API_VERSION) do |config|
  config.vm.define "web" do |web|
    web.vm.box = "muuran/centos-5.4"
    web.vm.network "private_network", ip: "192.168.33.10"
  end
  config.vm.define "ansible" do |ansible|
    ansible.vm.box = "ubuntu/trusty64"
    ansible.vm.network "private_network", ip: "192.168.33.100"
    ansible.vm.provision :file do |file|
      file.source      = '~/.vagrant.d/insecure_private_key'
      file.destination = '/home/vagrant/.ssh/id_rsa'
    end
    ansible.vm.provision "shell", path: "./ansible/provision.sh"
  end
end
