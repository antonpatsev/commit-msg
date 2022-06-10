#!/usr/bin/env bash

REGEX="^(feat|fix)\((alerts|backup|cicd|dns|git|github|gcloud|gke|gsuite|iam|inventory|spanner-autoscaler|terraform|tf)\):\s.*(DEVOPS-[0-9]+)\)$"
set -o errexit   # exit on error
set -o nounset   # fail if var undefined
set -o noclobber # don't overwrite exists files via >
set -o pipefail  # fails if pipes (|) fails

#MESSAGE_COMMITS="feat(tf): jjjj (DEVOPS-2596)"

while read -r line; do
# Reading each line
  echo $line
  if [[ ${line} =~ ${REGEX} ]]; then
    echo "Valid message commit:"
    echo "${line}"
  else
    echo "Invalid message commit:"
    echo "${line}"
    exit 1
  fi
done < commits.txt

#if [[ ${MESSAGE_COMMITS} =~ ${REGEX} ]]; then
#  echo "Valid message commit:"
#  echo "${MESSAGE_COMMITS}"
#else
#  echo "Invalid message commit:"
#  echo "${MESSAGE_COMMITS}"
#  exit 1
#fi