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

TEST_NAME="Wallet private_key check in $NAME wallet"

. ../runner.sh

NAME="$( jq -r '.wallet_test_name' "$config" )"

#--------------------------------------------------
KEY=($(cat $GLOBALPATH/log/wallet_name_"$NAME"_key.dat))
WPASS=$(cat $GLOBALPATH/log/wallet_name_"$NAME"_password.dat)


CMD=$($GLOBALPATH/bin/cleos.sh wallet private_keys -n $NAME --password $WPASS 2>$tpm_stderr)


ERR=$(cat $tpm_stderr)
if [[ $ERR != "" ]]; then
    failed "$ERR";
    rm $tpm_stderr;
    exit
fi


if [[ "$CMD" == *"${KEY[1]}"* ]]; then
    echo "1:$TEST_NAME" && sleep 2
else
    failed "Key not found in default wallet"
fi




