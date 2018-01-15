#!/usr/bin/env bash

SCRIPT=$1
TAGS=$(grep -Pv '^#' ~/project/vagrantup/ansible_tags.conf | awk -vORS=, '{print $1}' | sed -r 's/,+$//')
SKIPTAG=""

if [ "$USER" != "vagrant" ]; then
    SKIPTAG="--skip-tags=dev"
fi

if [ -e ~/project/vagrantup/$SCRIPT.yml ]; then
    PYTHONUNBUFFERED=1 /usr/bin/ansible-playbook ~/project/vagrantup/$SCRIPT.yml --tags=$TAGS $SKIPTAG
fi

if [ -e ~/project/vagrantup/$SCRIPT.custom.yml ]; then
    PYTHONUNBUFFERED=1 /usr/bin/ansible-playbook ~/project/vagrantup/$SCRIPT.custom.yml --tags=$TAGS $SKIPTAG
fi
