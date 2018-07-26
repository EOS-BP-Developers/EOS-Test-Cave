TEST_NAME="Set action permission for transfer"

. ../runner.sh

#----------------------
NAME="testaccountb"
PERMISSION_NAME="transfer"
CMD=$( $GLOBALPATH/bin/cleos.sh set action permission $NAME eosio.token transfer $PERMISSION_NAME 2>$tpm_stderr)

ERR=$(cat $tpm_stderr)

if [[ $ERR != *"executed transaction"* ]]; then
    failed "$ERR"
    rm $tpm_stderr;
else
    echo "1:$TEST_NAME"
fi
