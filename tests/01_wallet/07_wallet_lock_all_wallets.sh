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
TEST_NAME="Wallet lock all wallets"

. ../runner.sh

#-----------------------------------------------------------------------------------
CMD=$($GLOBALPATH/bin/cleos.sh wallet lock_all 2>$tpm_stderr)

ERR=$(cat $tpm_stderr)

if [[ $ERR != "" ]]; then
    failed "$ERR";
    rm $tpm_stderr;
else
    DATA=$($GLOBALPATH/bin/cleos.sh wallet keys 2>$tpm_stderr)
    ERR=$(cat $tpm_stderr)
    if [[ $ERR = *"Error 3120003: Locked wallet"* ]]; then
        echo "1:$TEST_NAME"
    else
        failed "There is still open wallet";
    fi


fi




