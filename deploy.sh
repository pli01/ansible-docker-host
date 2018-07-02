#!/bin/bash
set -e

# Activate configuration playbook of following services
export SERVICE_NTP_ENABLE=${SERVICE_NTP_ENABLE:-true}
export SERVICE_RSYSLOG_ENABLE=${SERVICE_RSYSLOG_ENABLE:-true}
export SERVICE_TINYPROXY_ENABLE=${SERVICE_TINYPROXY_ENABLE:-true}
export SERVICE_OPENSTACK_CLIENT_ENABLE=${SERVICE_OPENSTACK_CLIENT_ENABLE:-true}
export SERVICE_DOCKER_COMPOSE_ENABLE=${SERVICE_DOCKER_COMPOSE_ENABLE:-true}
export SERVICE_DOCKER_ENABLE=${SERVICE_DOCKER_ENABLE:-true}
export ANSIBLE_DEPLOY_LIMIT=${ANSIBLE_DEPLOY_LIMIT:-$(hostname -s)}
# use connection smart for ssh or local
export ANSIBLE_CONNECTION=${ANSIBLE_CONNECTION:-local}
export ANSIBLE_HOST_KEY_CHECKING=False
export ANSIBLE_BECOME_FLAGS="-E -H -S -n"

echo "Configuration started"
time ( cd $(dirname $0)/ansible &&
  ansible-playbook -i config -c ${ANSIBLE_CONNECTION} -l ${ANSIBLE_DEPLOY_LIMIT} \
     playbooks/site.yml --list-tasks --list-hosts  && \
  ansible-playbook -i config -c ${ANSIBLE_CONNECTION} -l ${ANSIBLE_DEPLOY_LIMIT} \
     playbooks/site.yml -v
)
