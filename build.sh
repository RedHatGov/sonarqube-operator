#!/bin/bash
# Update latest Roles
rm -rf roles
mkdir roles
git clone https://github.com/redhat-gpte-devopsautomation/ansible-operator-roles
cp -R ansible-operator-roles/roles/postgresql-ocp ./roles
cp -R ansible-operator-roles/roles/sonarqube-ocp ./roles
cp ansible-operator-roles/playbooks/sonarqube.yaml ./playbook.yml
rm -rf ansible-operator-roles

# Now build the Operator
operator-sdk build quay.io/wkulhanek/sonarqube-operator:v0.0.6
docker push quay.io/wkulhanek/sonarqube-operator:v0.0.6
