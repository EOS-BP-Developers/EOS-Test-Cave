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

TEST_NAME="Create EOS Key and import to wallet"

. ../runner.sh

NAME="$( jq -r '.wallet_test_name' "$config" )"

#-------------------------------------------------------
CMD1=($($GLOBALPATH/bin/cleos.sh create key))
PRIV_KEY=${CMD1[2]}
PUB_KEY=${CMD1[5]}

CMD=$($GLOBALPATH/bin/cleos.sh wallet import -n $NAME --private-key $PRIV_KEY 2>$tpm_stderr)

ERR=$(cat $tpm_stderr)

if [[ $ERR != "" ]]; then
    failed "$ERR"
    rm $tpm_stderr
else
    RES_PUB_KEY=($CMD)

    if [[ "${RES_PUB_KEY[4]}" == "$PUB_KEY" ]]; then
        echo "1:$TEST_NAME"
	echo "$PUB_KEY $PRIV_KEY" >> "$GLOBALPATH/log/wallet_name_"$NAME"_key.dat"
    else
        failed "Created Pub Key ($PUB_KEY) != Imported (${RES_PUB_KEY[4]})"
    fi

fi




