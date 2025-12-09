#!/bin/bash

set -euo pipefail

source /etc/os-release
if [ "$ID" == "centos" ]; then
    cp /manifests/okd_quickstarts/toolhive-quickstart.yaml /manifests/toolhive-quickstart.yaml
    cp /manifests/okd_quickstarts/do-not-move.yaml /manifests/do-not-move.yaml
    rm -f /manifests/install-multicluster-engine.yaml
fi