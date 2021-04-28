#!/bin/bash -ex
# Exports correct environment for the CI system (relies on ci-setup.sh) and runs requested tests

export KUBECONFIG=$HOME/.kube/config
export PATH="$HOME/.local/bin:$PATH"
export OPERATORDIR="$(pwd)"
make kustomize
[ -f ./bin/kustomize ] && export KUSTOMIZE_PATH="$(realpath ./bin/kustomize)" || export KUSTOMIZE_PATH="$(which kustomize)"

TEST_OPERATOR_NAMESPACE=default molecule test -s $1
