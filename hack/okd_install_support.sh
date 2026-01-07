#!/bin/bash

set -euo pipefail

# Function to set all include.release.openshift.io annotations to false
set_annotations_to_false() {
  local file="$1"
  sed -i "/include\.release\.openshift\.io/s/true/false/g" "$file"
}

source /etc/os-release
if [ "$ID" == "centos" ]; then
  cp /manifests/okd_quickstarts/toolhive-quickstart.yaml /manifests/toolhive-quickstart.yaml
  cp /manifests/okd_quickstarts/do-not-move.yaml /manifests/do-not-move.yaml

  # Set all include.release.openshift.io annotations to false
  set_annotations_to_false /manifests/install-multicluster-engine.yaml
  set_annotations_to_false /manifests/do-not-move.yaml
fi

