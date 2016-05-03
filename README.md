# vagrant-ubuntu-php7-template
Template for create new PHP7 project using Vagrant based on Ubuntu. Postgresql as database.

Installation
------------
- copy template to project
- edit hostname in Vagrantfile
- if it's Yii2 project - ucomment fxp/composer-asset-plugin in composer_install.sh
- edit provisioning.yml (Ansible playbook)
- edit templates/nginx.conf - set your web root and your bootstrap php script

Why ansible? Because :)
