TEST_NAME="Deploy eosio.bios contract"

. ../runner.sh

#----------------------
CMD=$( sleep 1 && $GLOBALPATH/bin/cleos.sh set contract eosio $GLOBALPATH/contracts/eosio.bios 2>$tpm_stderr)

ERR=$(cat $tpm_stderr)

if [[ $ERR != *"executed transaction"* ]]; then
    failed "$ERR"
    rm $tpm_stderr;
fi

CMD2=$( sleep 1 && $GLOBALPATH/bin/cleos.sh get code eosio 1>$tpm_stderr)
ERR=$(cat $tpm_stderr)
if [[ $ERR != *"0000000000000000000000000000000000000000000000000000000000000000"* ]]; then
	echo "1:$TEST_NAME"
else
    failed "$ERR"
    rm $tpm_stderr;
fi

