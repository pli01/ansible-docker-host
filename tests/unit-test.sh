#!/bin/bash
set -ex

time ( cd $(dirname $0)/../ansible

test -x "$(type -p ansible-lint)" && ansible-lint -x ANSIBLE0010,ANSIBLE0013 playbooks/*.yml

  echo "ansible syntax-check"
  ansible-playbook -i config -c local -l localhost \
     playbooks/site.yml -v \
    --syntax-check

  echo "ansible list-tasks"
  ansible-playbook -i config -c local -l localhost \
     playbooks/site.yml -v \
    --list-tasks
)
