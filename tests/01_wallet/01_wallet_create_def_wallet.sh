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
TEST_NAME="Create default wallet"

. ../runner.sh

#----------------------

CMD=$( sleep 1 && $GLOBALPATH/bin/cleos.sh wallet create 2>$tpm_stderr)

ERR=$(cat $tpm_stderr)

if [[ $ERR != "" ]]; then
    failed "$ERR"
    rm $tpm_stderr;
else
    WALLET_PASS=$(echo $CMD | awk -F\" '{ print $2 }')
    echo $WALLET_PASS > $GLOBALPATH/log/wallet_default_password.dat
    echo "1:$TEST_NAME"


fi




