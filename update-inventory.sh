#!/bin/bash
set -e

IP=$(cd terraform && terraform.exe output -raw web_server_public_ip)

cat > ansible/inventory.ini <<EOF
[webservers]
web1 ansible_host=$IP ansible_user=ubuntu ansible_ssh_private_key_file=/home/noor/.ssh/aws-devops-lab
EOF