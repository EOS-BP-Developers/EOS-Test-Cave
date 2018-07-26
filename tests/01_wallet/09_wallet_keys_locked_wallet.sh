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
TEST_NAME="Are keys list disabled for locked wallets"

. ../runner.sh

NAME="$( jq -r '.wallet_test_name' "$config" )"

#---------------------------------------------------------------------------

CMD=$($GLOBALPATH/bin/cleos.sh wallet keys 2>$tpm_stderr)

ERR=$(cat $tpm_stderr)

rm $tpm_stderr;

if [[ "$ERR" == *"Locked wallet"* ]]; then
    echo "1:$TEST_NAME"
else
    failed "Some keys still listed.";
fi






