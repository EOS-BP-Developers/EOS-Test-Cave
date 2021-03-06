#!/bin/bash

TEST_NAME="Create and import EOS Key"

. ../runner.sh

#--------------------------------------------------
CMD1=($($GLOBALPATH/bin/cleos.sh create key --to-console))
PRIV_KEY=${CMD1[2]} 
PUB_KEY=${CMD1[5]}

CMD=$($GLOBALPATH/bin/cleos.sh wallet import --private-key $PRIV_KEY 2>$tpm_stderr)

ERR=$(cat $tpm_stderr)

if [[ $ERR != "" ]]; then
    failed "$ERR"
    rm $tpm_stderr;
else
    RES_PUB_KEY=($CMD)

    if [[ "${RES_PUB_KEY[4]}" == "$PUB_KEY" ]]; then
	echo "$PUB_KEY $PRIV_KEY" >> $GLOBALPATH/log/wallet_default_key.dat
	echo "1:$TEST_NAME"
    else
	failed "Created Pub Key ($PUB_KEY) != Imported (${RES_PUB_KEY[4]})"
    fi
fi
