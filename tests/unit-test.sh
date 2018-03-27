#!/bin/bash
set -ex

time ( cd $(dirname $0)/../ansible &&
  ansible-lint -x ANSIBLE0010  playbooks/*.yml

  echo "ansible syntax-check"
  ansible-playbook -i config -c local -l localhost \
     playbooks/site.yml -v \
    --syntax-check

  echo "ansible list-tasks"
  ansible-playbook -i config -c local -l localhost \
     playbooks/site.yml -v \
    --list-tasks
)
