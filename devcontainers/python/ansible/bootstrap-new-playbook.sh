#!/bin/bash

cp /config/ansible.cfg .
cp /config/hosts.example.yaml ./inventory.yaml

mkdir ./collections
mkdir ./playbooks
mkdir ./roles

echo "---" > ./playbooks/main.yaml
echo "- name: playbook" >> ./playbooks/main.yaml
echo "  hosts: all" >> ./playbooks/main.yaml
echo "  become: true" >> ./playbooks/main.yaml

