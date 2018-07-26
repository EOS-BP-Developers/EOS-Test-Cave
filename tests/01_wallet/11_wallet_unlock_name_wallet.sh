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

TEST_NAME="Wallet unlock wallet name: $NAME"

. ../runner.sh

NAME="$( jq -r '.wallet_test_name' "$config" )"




#----------------------------------------------------------------------------------------------
WPASS=$(cat "$GLOBALPATH/log/wallet_name_"$NAME"_password.dat")
CMD=$($GLOBALPATH/bin/cleos.sh wallet unlock -n $NAME --password $WPASS 2>$tpm_stderr)

ERR=$(cat $tpm_stderr)

if [[ $ERR != "" ]]; then
    failed "$ERR";
    rm $tpm_stderr;
else
    DATA=($CMD)
    if [[ "${DATA[0]}" == "Unlocked:" && "${DATA[1]}" == "$NAME" ]]; then
        echo "1:$TEST_NAME"
    else
        failed "Wallet name $NAME is not unlocked";
    fi
fi




