#!/bin/bash
set -e

bash update-inventory.sh

cd ansible

ansible-playbook -i inventory.ini deploy.yml