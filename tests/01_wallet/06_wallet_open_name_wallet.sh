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
TEST_NAME="Wallet open wallet name: $NAME"

. ../runner.sh

NAME="$( jq -r '.wallet_test_name' "$config" )"



#----------------------------------------------------------------------

CMD=$($GLOBALPATH/bin/cleos.sh wallet open -n $NAME 2>$tpm_stderr)

ERR=$(cat $tpm_stderr)

if [[ $ERR != "" ]]; then
    failed $ERR;
    rm $tpm_stderr;
else
    DATA=($CMD)
    if [[ "${DATA[0]}" == "Opened:" && "${DATA[1]}" == "$NAME" ]]; then
        echo "1:$TEST_NAME" && sleep 2
    else
        failed "Wallet name $NAME do not opens";
    fi


fi




