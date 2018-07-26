#!/bin/bash
################################################################################
#
# EOS Testing cave
#
# Created by Bohdan Kossak
# 2018 CryptoLions.io
#
# For automated testing EOS software
#
# Git Hub: https://github.com/CryptoLions
# Eos Network Monitor: http://eosnetworkmonitor.io/
#
#
###############################################################################



TEST_NAME="Create wallet with name $NAME"

. ../runner.sh

NAME="$( jq -r '.wallet_test_name' "$config" )"

#----------------------------------

CMD=$($GLOBALPATH/bin/cleos.sh wallet create -n $NAME 2>$tpm_stderr)

ERR=$(cat $tpm_stderr)

if [[ $ERR != "" ]]; then
    failed "$ERR"
    rm $tpm_stderr;
else
    WALLET_PASS=$(echo $CMD | awk -F\" '{ print $2 }')
    echo $WALLET_PASS > "$GLOBALPATH/log/wallet_name_"$NAME"_password.dat"
    echo "1:$TEST_NAME" && sleep 2
fi




