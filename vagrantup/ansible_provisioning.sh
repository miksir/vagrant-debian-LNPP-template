#!/usr/bin/env bash

TAGS=$(grep -Pv '^#' ~/project/vagrantup/ansible_tags.conf | awk -vORS=, '{print $1}' | sed -r 's/,+$//')
SKIPTAG=""

if [ "$USER" != "vagrant" ]; then
    SKIPTAG="--skip-tags=dev"
fi

PYTHONUNBUFFERED=1 /usr/bin/ansible-playbook ~/project/vagrantup/provisioning.yml --tags=$TAGS $SKIPTAG
