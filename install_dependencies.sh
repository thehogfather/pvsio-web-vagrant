#!/usr/bin/env bash

#install unzip
apt-get install -y unzip

#create download directories
mkdir /home/vagrant/pvs
mkdir /home/vagrant/nodejs

#download pvs sbcl and nodejs
wget -qO /home/vagrant/pvs/pvs.tar.gz http://pvs.csl.sri.com/download-open/pvs-6.0-ix86-Linux-sbclisp.tgz
wget -qO /home/vagrant/nodejs/node.tar.gz https://nodejs.org/dist/v0.12.7/node-v0.12.7-linux-x86.tar.gz

#extract and install pvs
cd /home/vagrant/pvs
tar -xzf pvs.tar.gz
. bin/relocate
ln -s /home/vagrant/pvs/pvs /usr/bin/pvs
ln -s /home/vagrant/pvs/pvsio /usr/bin/pvsio
ln -s /home/vagrant/pvs/proveit /usr/bin/proveit

#extract and install nodejs
cd /home/vagrant/nodejs
tar -xzf node.tar.gz
ln -s /home/vagrant/nodejs/node-v0.12.7-linux-x86/bin/node /usr/bin/node
ln -s /home/vagrant/nodejs/node-v0.12.7-linux-x86/bin/npm /usr/bin/npm

#clone and install pvsio-web
cd /home/vagrant
wget -q https://github.com/thehogfather/pvsio-web/archive/master.zip
unzip master.zip
cd /home/vagrant/pvsio-web-master
npm install
. restart.sh