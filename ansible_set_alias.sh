#!/usr/bin/env bash

#set -o errexit
#set -o nounset
#set -eu -o pipefail
#set -x
#trap read debug

commands='ansible
ansible-config
ansible-connection
ansible-console
ansible-galaxy
ansible-inventory
ansible-playbook
ansible-pull
ansible-test
ansible-vault'

container_name='ansible'

for command in $commands; do 
	alias $command="docker exec -it "$container_name" ./"$command""$1""
done
