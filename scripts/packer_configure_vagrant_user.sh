#!/bin/bash

# Configure Non-Interactive UI to suppress known silent install warnings
export DEBIAN_FRONTEND=noninteractive
export APT_KEY_DONT_WARN_ON_DANGEROUS_USAGE=DontWarn
export TERM=linux

# # Add no-password sudo config for vagrant user
# echo "%vagrant ALL=NOPASSWD:ALL" > /etc/sudoers.d/vagrant
# chmod 0440 /etc/sudoers.d/vagrant

# # Add vagrant to sudo group
# usermod -a -G sudo vagrant

# Install vagrant key
mkdir /home/vagrant/.ssh
chmod 700 /home/vagrant/.ssh
cd /home/vagrant/.ssh
wget -q --no-check-certificate 'https://raw.githubusercontent.com/mitchellh/vagrant/master/keys/vagrant.pub' -O authorized_keys
chmod 600 /home/vagrant/.ssh/authorized_keys
chown -R vagrant /home/vagrant/.ssh

# Install NFS for Vagrant
apt-get install -y nfs-common

exit 0