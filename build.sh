#!/bin/bash
operator-sdk build quay.io/wkulhanek/sonarqube-operator:v0.0.1
docker push quay.io/wkulhanek/sonarqube-operator:v0.0.1
