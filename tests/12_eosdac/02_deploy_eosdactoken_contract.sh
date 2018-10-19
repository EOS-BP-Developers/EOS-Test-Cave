TEST_NAME="Deploy eosdactoken contract"

. ../runner.sh

#----------------------
ACCOUNT="eosdactokens"

CMD=$( $GLOBALPATH/bin/cleos.sh set contract $ACCOUNT $GLOBALPATH/contracts/eosdactoken 2>$tpm_stderr)

ERR=$(cat $tpm_stderr)

if [[ $ERR != *"executed transaction"* ]]; then
    failed "$ERR"
    rm $tpm_stderr;
fi

CMD2=$( $GLOBALPATH/bin/cleos.sh get code $ACCOUNT 1>$tpm_stderr)
ERR=$(cat $tpm_stderr)
if [[ $ERR != *"0000000000000000000000000000000000000000000000000000000000000000"* ]]; then
	echo "1:$TEST_NAME"
else
    failed "$ERR"
    rm $tpm_stderr;
fi

