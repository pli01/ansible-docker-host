# ansible-docker-host

This role install and configure docker on a host or group of host
It configure:
  * ntp
  * tinyproxy
  * docker-compose
  * docker

# Configuration

To override default configuration, add config file in the following directory with files numbered greater (ex: 100-config)
  * Default config
    * ansible/config/inventory/200-group-docker
    * ansible/config/group_vars/docker/000-default
  * Overide Config
    * ansible/config/inventory/100-my-inventory
    * ansible/config/inventory/300-my-group
    * ansible/config/group_vars/100-my-config

# Build
  * make build
  * find the result in build dir

# Package
  * make package
  * find the result in dist/

# Deploy
  * from the dist or build, execute "bash deploy.sh"
  * ANSIBLE_DEPLOY_LOCAL=localhost if deploy on localhost machine
