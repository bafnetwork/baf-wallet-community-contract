#!/bin/bash
# TODO: help
if [ "$1" = "-h" ] || [ "$#" -ne 2 ]; then
  echo "Usage: ./mainnet-deploy [Contract ID] [Deploying Account ID] [Initial Account ID]"
  exit 0
fi
echo $1
echo $2
# near deploy [accountId] [wasmFile] [initFunction] [initArgs] [initGas] [initDeposit]
near deploy $1 target/wasm32-unknown-unknown/release/community_contract.wasm --masterAccount $2 --networkId mainnet

near call $(cat neardev/dev-account) new --accountId=$2 --networkId mainnet
near call $(cat neardev/dev-account) add_admins --accountId=$2 --args "{\"new_admins\": [\"$3\"]}" --networkId mainnet
