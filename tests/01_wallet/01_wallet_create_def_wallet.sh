#!/bin/bash

TEST_NAME="Create default wallet"

. ../runner.sh

#----------------------

CMD=$( $GLOBALPATH/bin/cleos.sh wallet create --to-console 2>$tpm_stderr)

ERR=$(cat $tpm_stderr)

if [[ $ERR != "" ]]; then
    failed "$ERR"
    rm $tpm_stderr;
else
    WALLET_PASS=$(echo $CMD | awk -F\" '{ print $2 }')
    echo $WALLET_PASS > $GLOBALPATH/log/wallet_default_password.dat
    echo "1:$TEST_NAME"


fi




