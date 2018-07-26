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
TEST_NAME="Wallet unlock default wallet"

. ../runner.sh

#----------------------------------------------------------------------------------------------
WPASS=$(cat $GLOBALPATH/log/wallet_default_password.dat)
CMD=$($GLOBALPATH/bin/cleos.sh wallet unlock --password "$WPASS" 2>$tpm_stderr)

ERR=$(cat $tpm_stderr)

if [[ $ERR != "" ]]; then
    failed "$ERR";
    rm $tpm_stderr;
else
    DATA=($CMD)
    if [[ "${DATA[0]}" == "Unlocked:" && "${DATA[1]}" == "default" ]]; then
        echo "1:$TEST_NAME" && sleep 2
    else
        failed "Wallet not unlocked";
    fi


fi




