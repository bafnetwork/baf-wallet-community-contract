#!/bin/bash
# TODO: help
if [ "$1" = "-h" ] || [ "$#" -ne 2 ]; then
  echo "Usage: ./dev-deploy [Deploying Account ID] [Initial Admin Accound ID]"
  exit 0
fi
echo $1
echo $2
near dev-deploy target/wasm32-unknown-unknown/release/community_contract.wasm

near call $(cat neardev/dev-account) new --accountId=$1
near call $(cat neardev/dev-account) add_admins --accountId=$1 --args "{\"new_admins\": [\"$2\"]}"
