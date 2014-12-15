#!/usr/bin/env bash

if ! [ `which ansible` ]; then
  apt-get install -y software-properties-common
  apt-add-repository -y ppa:ansible/ansible
  apt-get -y update
  apt-get install -y ansible
fi

export ANSIBLE_HOST_KEY_CHECKING=False
#ansible all -i /vagrant/ansible/hosts -m ping -u vagrant --private-key=/home/vagrant/.ssh/id_rsa
ansible-playbook -i /vagrant/ansible/hosts-dev /vagrant/ansible/site.yml -u vagrant --private-key=/home/vagrant/.ssh/id_rsa
