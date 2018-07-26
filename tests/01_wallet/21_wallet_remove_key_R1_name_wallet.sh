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

TEST_NAME="Wallet remove_key R1 from $NAME wallet"

. ../runner.sh

NAME="$( jq -r '.wallet_test_name' "$config" )"

#--------------------------------------------------
WPASS=$(cat $GLOBALPATH/log/wallet_name_"$NAME"_password.dat)
PUB_KEY=$(cat $GLOBALPATH/log/wallet_create_key_name_r1.dat)

CMD1=$($GLOBALPATH/bin/cleos.sh wallet remove_key -n $NAME --password $WPASS $PUB_KEY 2>$tpm_stderr)

ERR=$(cat $tpm_stderr)
if [[ $ERR != "" ]]; then
    failed "$ERR";
    rm $tpm_stderr;
    exit
fi


CMD=$($GLOBALPATH/bin/cleos.sh wallet keys 2>$tpm_stderr)

ERR=$(cat $tpm_stderr)

if [[ "$CMD" != *"$PUB_KEY"* ]]; then
    echo "1:$TEST_NAME" && sleep 2
else
    failed "K1 key was not removed from $NAME wallet"
fi




