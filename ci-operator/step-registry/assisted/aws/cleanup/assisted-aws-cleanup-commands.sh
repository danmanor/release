#!/bin/bash

set -o nounset
set -o errexit
set -o pipefail

echo "************ assisted aws cleanup command ************"

#!/bin/bash

set -x
set -o nounset
set -o errexit
set -o pipefail

export AWS_ACCESS_KEY_ID="${CLUSTER_PROFILE_DIR}/aws-access-key"
if [ ! -f "${AWS_ACCESS_KEY_ID}" ]; then
  echo "AWS_ACCESS_KEY_ID file not found at ${AWS_ACCESS_KEY_ID}"
  exit 1
fi

export AWS_SECRET_ACCESS_KEY="${CLUSTER_PROFILE_DIR}/aws-secret-access-key"
if [ ! -f "${AWS_SECRET_ACCESS_KEY}" ]; then
  echo "AWS_SECRET_ACCESS_KEY file not found at ${AWS_SECRET_ACCESS_KEY}"
  exit 1
fi

export SLACK_TOKEN="${CLUSTER_PROFILE_DIR}/slack-token"
if [ ! -f "${SLACK_TOKEN}" ]; then
  echo "SLACK_TOKEN file not found at ${SLACK_TOKEN}"
  exit 1
fi

cd "${ANSIBLE_PLAYBOOK_DIRECTORY}"
ansible-playbook "${ANSIBLE_CLEANUP_PLAYBOOK}" -vv
