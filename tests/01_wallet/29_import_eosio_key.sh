#!/bin/bash

TEST_NAME="Import eosio key to wallet"

. ../runner.sh

KEY="$( jq -r '.eosio_key' "$config" )"

#-------------------------------------------------------

CMD=$($GLOBALPATH/bin/cleos.sh wallet import --private-key $KEY 2>$tpm_stderr)

ERR=$(cat $tpm_stderr)

if [[ $ERR != "" ]]; then
    failed "$ERR"
    rm $tpm_stderr
else
        echo "1:$TEST_NAME"
fi
