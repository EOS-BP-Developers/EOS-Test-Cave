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
TEST_NAME="Wallet list for  unlocked wallets"

. ../runner.sh

NAME="$( jq -r '.wallet_test_name' "$config" )"

#---------------------------------------------------------------------------

CMD=$($GLOBALPATH/bin/cleos.sh wallet list 2>$tpm_stderr)

ERR=$(cat $tpm_stderr)

if [[ $ERR != "" ]]; then
    failed "$ERR";
    rm $tpm_stderr;
else

    if [[ "$CMD" == *"\"default *\""* && "$CMD" == *"\"$NAME *\""* ]]; then

        echo "1:$TEST_NAME"
    else
        failed "Some wallets listed are not unlocked or not in list.";
    fi


fi




