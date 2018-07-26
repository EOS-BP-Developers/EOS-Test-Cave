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

TEST_NAME="Wallet lock $NAME wallet"

. ../runner.sh

NAME="$( jq -r '.wallet_test_name' "$config" )"


#-----------------------------------------------------------------------------------
CMD=$($GLOBALPATH/bin/cleos.sh wallet lock -n $NAME 2>$tpm_stderr)

ERR=$(cat $tpm_stderr)

if [[ $ERR != "" ]]; then
    failed "$ERR";
    rm $tpm_stderr;
else

    DATA=$($GLOBALPATH/bin/cleos.sh wallet keys 2>$tpm_stderr)
    ERR=$(cat $tpm_stderr)


    NAME_KEY=($(cat $GLOBALPATH/log/wallet_name_testwallet_key.dat))

    if [[ "$DATA" != *"${NAME_KEY[0]}"* ]]; then
        echo "1:$TEST_NAME" && sleep 2
    else
        failed "Wallet $NAME wasn't locked";
    fi




fi




