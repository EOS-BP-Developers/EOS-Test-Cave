#!/bin/bash

TEST_NAME="Resign eosio"

. ../runner.sh

KEY="$( jq -r '.eosio_pub_key' "$config" )"

#----------------------

account="eosio"
controller="eosio.prods"

#CMD=$($GLOBALPATH/bin/cleos.sh push action eosio updateauth '{"account": "'$account'", "permission": "owner",  "parent": "",  "auth": { "threshold": 1, "keys": [], "waits": [], "accounts": [{ "weight": 1, "permission": {"actor": "'$controller'", "permission": "active"} }] } } ' -p $account@owner 2>$tpm_stderr)
#CMD=$($GLOBALPATH/bin/cleos.sh push action eosio updateauth '{"account": "'$account'", "permission": "active",  "parent": "owner",  "auth": { "threshold": 1, "keys": [], "waits": [], "accounts": [{ "weight": 1, "permission": {"actor": "'$controller'", "permission": "active"} }] } }' -p $account@active 2>$tpm_stderr)

accounts=( eosio.bpay eosio.msig eosio.names eosio.ram eosio.ramfee eosio.saving eosio.stake eosio.token eosio.vpay );
for sa in "${accounts[@]}"
do
    account="$sa"
    controller="eosio"
    #CMD=$($GLOBALPATH/bin/cleos.sh push action eosio updateauth '{"account": "'$account'", "permission": "owner",  "parent": "",  "auth": { "threshold": 1, "keys": [], "waits": [], "accounts": [{ "weight": 1, "permission": {"actor": "'$controller'", "permission": "active"} }] } } ' -p $account@owner 2>$tpm_stderr)
    #CMD=$($GLOBALPATH/bin/cleos.sh push action eosio updateauth '{"account": "'$account'", "permission": "active",  "parent": "owner",  "auth": { "threshold": 1, "keys": [], "waits": [], "accounts": [{ "weight": 1, "permission": {"actor": "'$controller'", "permission": "active"} }] } }' -p $account@active 2>$tpm_stderr)
done

echo "1:$TEST_NAME"
