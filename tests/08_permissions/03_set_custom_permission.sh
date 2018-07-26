TEST_NAME="Set custom permission"

. ../runner.sh

PUB_KEY=$( cat $GLOBALPATH/log/wallet_default_key.dat | cut -d' ' -f1)
#----------------------
NAME="testaccountb"
PERMISSION_NAME="transfer"
CMD=$( sleep 1 && $GLOBALPATH/bin/cleos.sh set account permission $NAME $PERMISSION_NAME $PUB_KEY active 2>$tpm_stderr)

ERR=$(cat $tpm_stderr)

if [[ $ERR != *"executed transaction"* ]]; then
    failed "$ERR"
    rm $tpm_stderr;
    exit 1;
fi
CMD2=$( sleep 1 && $GLOBALPATH/bin/cleos.sh get account $NAME | grep $PERMISSION_NAME | grep $PUB_KEY>$tpm_stderr)
ERR=$(cat $tpm_stderr)
if [[ -z "$ERR" ]]; then
    failed "$ERR"
    rm $tpm_stderr;
else
    echo "1:$TEST_NAME"
fi
