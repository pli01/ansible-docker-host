#!/bin/bash
set -e

# Activate configuration playbook of following services
SERVICE_DOCKER_COMPOSE_ENABLE=${SERVICE_DOCKER_COMPOSE_ENABLE:-true}
SERVICE_DOCKER_ENABLE=${SERVICE_DOCKER_ENABLE:-true}

export SERVICE_DOCKER_ENABLE SERVICE_DOCKER_COMPOSE_ENABLE
echo "Configuration started"
time ( cd $(dirname $0)/ansible &&
  ansible-playbook -i config -c local -l localhost \
     playbooks/site.yml -v
)
