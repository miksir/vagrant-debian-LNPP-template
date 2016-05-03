#!/bin/sh
echo Installing ansible...
export DEBIAN_FRONTEND=noninteractive
apt-get -y update >/dev/null
apt-get -t trusty-backports -y install ansible
echo localhost ansible_connection=local >>/etc/ansible/hosts
