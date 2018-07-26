#!/bin/bash

TEST_NAME="Get ABP account info"

. ../runner.sh

NAME="$( jq -r '.abp_account_name' "$config" )"

#----------------------

CMD=$( $GLOBALPATH/bin/cleos.sh get account $NAME 2>$tpm_stderr)

ERR=$(cat $tpm_stderr)

if [[ $ERR != "" ]]; then
    failed "$ERR"
    rm $tpm_stderr;
else
    echo "1:$TEST_NAME" && sleep 2
fi
