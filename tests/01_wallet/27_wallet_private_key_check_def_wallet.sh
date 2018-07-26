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
TEST_NAME="Wallet private_key check in default wallet"

. ../runner.sh

#--------------------------------------------------
KEY=($(cat $GLOBALPATH/log/wallet_default_key.dat))
WPASS=$(cat $GLOBALPATH/log/wallet_default_password.dat)


CMD=$($GLOBALPATH/bin/cleos.sh wallet private_keys --password $WPASS 2>$tpm_stderr)


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




