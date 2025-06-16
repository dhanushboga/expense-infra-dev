#!/bin/bash

dnf install ansible -y
cd /tmp

git clone https://github.com/dhanushboga/ansible-expense.git

cd ansible-expense

ansible-playbook -i inventory.ini mysql.yaml
ansible-playbook -i inventory.ini backend.yaml
ansible-playbook -i inventory.ini frontend.yaml