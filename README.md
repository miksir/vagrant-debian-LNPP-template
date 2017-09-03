# Vagrant template
Template for create new PHP7 project using Vagrant based on Debian. 

Can install
 * Nginx
 * PHP 7.0 (with XDebug), composer
 * Postgresql 9.6
 * MySQL 5.6 or 5.7 (mysql repository)
 * MariaDb 10.1 (MariaDb repository, config differs from Debian repository)
 * Elasticsearch 2.x with Java 8
 * NodeJs 6.x
 * Redis 2.8 or 3.x

Can run
 * npm install
 * composer install
 * webpack, etc

Ansible is not required on host machine because executed on guest.


Supported tags
--------------
- `dotdeb` - add Dotdeb repository (required and auto-enabled for PHP7) 
- `postgresql` - add postgresql repo and install Postgresql 9.6
- `mysql56` or `mysql57` - add mysql repo and install MySQL 5.6 or 5.7 (not both same time)
- `mariadb101` - add MariaDb repo and install MariaDb 10.1 (not same time with MySQL)
- `redis` - install Redis server, version 2.8 or 3.x if `dotdeb` enabled 
- `php7` - add Dotdeb repository and install PHP7.0
- `php7_pgsql`, `php7_mysql`, `php7_redis` - install some PHP7 extensions
- `elasticsearch` - install Elasticsearch + Oracle Java 8
- `java` - install Oracle Java 8
- `nginx` - install nginx, edit config and install project config from template
- `composer` - install composer 
- `nodejs` - install nodejs 
- `yarn` - install yarn
- `yarn_replace_npm` - install yarn and replace npm
- `yii2` - install fxp/composer-asset-plugin (composer required)
- `exim` - install exim4 and configure for internet delivery
- `sphinx` - install sphinxsearch

Special tag `dev` - exclude this tag to setup production  

You can always list all tags with command  
`ansible-playbook ~/project/vagrantup/provisioning.yml --list-tags`

Startup playbook
----------------
For start some daemons on boot separate playbook created: `startup.yml` 


Project prepare playbook
---------------------------
This playbook can install composer, npm and much more. Open and edit it.
This playbook disabled in `Vagrantfile`. If you want to execute it, run
`vagrant provision --provision-with=setup`


Installation
------------
- copy this template to your project
- edit hostname in `Vagrantfile`, check and edit/remove forwarded ports
- check `vagrantup/provisioning.yml`
- edit `vagrantup/ansible_tags.yml`, comment/uncomment required options
- edit `vagrantup/templates/nginx.conf`
- check `vagrantup/startup.yml`, if some services required - add it
- `vagrant up`

Symlinks check
--------------
If your host OS - Windows, you can get `Symbol links disabled` message.

Administrator users (belongs to Administrator group) with active UAC can't create
symbol links in Windows. As result - guest machine can't create symbol links in project
directory because host machine deny it. Simple solution: run `vagrant up` as Administrator
or disable UAC.

Production?
-----------
Well, for small projects I am using this `provisioning.yml` playbook for setup production 
virtual server too. But production does not 100% match dev config. Special tag `dev` added
to dev related tasks. In production envelopment we can run playbook with `--skip-tags=dev`
  
Or you can try to run `sh ~/project/vagrantup/ansible_provisioning.sh`, which will test 
local user, and if it is not `vagrant` - run provision in non-dev mode.

Also, if `startup.yml` used - you need to create service and run this playbook on boot.

Ansible
-------
Why ansible? Because :)  
Q: Can I use this template if not familial with Ansible?  
A: If you don't need to create new rules/tasks then no need to know Ansible well. 
But basic concepts of playbook, tasks, tags are better to know. 
