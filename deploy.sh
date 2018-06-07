#!/bin/bash
set -e

# Activate configuration playbook of following services
export SERVICE_NTP_ENABLE=${SERVICE_NTP_ENABLE:-true}
export SERVICE_RSYSLOG_ENABLE=${SERVICE_RSYSLOG_ENABLE:-true}
export SERVICE_TINYPROXY_ENABLE=${SERVICE_TINYPROXY_ENABLE:-true}
export SERVICE_OPENSTACK_CLIENT_ENABLE=${SERVICE_OPENSTACK_CLIENT_ENABLE:-true}
export SERVICE_DOCKER_COMPOSE_ENABLE=${SERVICE_DOCKER_COMPOSE_ENABLE:-true}
export SERVICE_DOCKER_ENABLE=${SERVICE_DOCKER_ENABLE:-true}
export ANSIBLE_DEPLOY_LOCAL=${ANSIBLE_DEPLOY_LOCAL:-$(hostname -s)}

echo "Configuration started"
time ( cd $(dirname $0)/ansible &&
  ansible-playbook -i config -c local -l ${ANSIBLE_DEPLOY_LOCAL} \
     playbooks/site.yml -v
)
