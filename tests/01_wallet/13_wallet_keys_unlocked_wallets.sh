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
TEST_NAME="Check keys list in unlocked wallets (wallet keys)"

. ../runner.sh

NAME="$( jq -r '.wallet_test_name' "$config" )"

#---------------------------------------------------------------------------
CMD=$($GLOBALPATH/bin/cleos.sh wallet keys 2>$tpm_stderr)

ERR=$(cat $tpm_stderr)

if [[ $ERR != "" ]]; then
    failed "$ERR";
    rm $tpm_stderr;
else

    DEFF_KEY=($(cat $GLOBALPATH/log/wallet_default_key.dat))
    NAME_KEY=($(cat $GLOBALPATH/log/wallet_name_testwallet_key.dat))

    if [[ "$CMD" == *"${DEFF_KEY[0]}"* && "$CMD" == *"${NAME_KEY[0]}"* ]]; then

        echo "1:$TEST_NAME"
    else
        failed "Not all keys in List.";
    fi


fi




