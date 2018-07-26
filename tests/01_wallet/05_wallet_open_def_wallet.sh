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
TEST_NAME="Wallet open default wallet"

. ../runner.sh

#-----------------------------------------------------------------------------

CMD=$($GLOBALPATH/bin/cleos.sh wallet open 2>$tpm_stderr)

ERR=$(cat $tpm_stderr)

if [[ $ERR != "" ]]; then
    failed "$ERR";
    rm $tpm_stderr;
else
    DATA=($CMD)
    if [[ "${DATA[0]}" == "Opened:" && "${DATA[1]}" == "default" ]]; then
        echo "1:$TEST_NAME" && sleep 2
    else
        failed "Wallet do not opens";
    fi


fi




