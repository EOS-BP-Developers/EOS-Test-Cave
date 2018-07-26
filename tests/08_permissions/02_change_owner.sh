TEST_NAME="Change owner key"

. ../runner.sh

NAME="$( jq -r '.abp_account_name' "$config" )"
PUB_KEY=$( cat $GLOBALPATH/log/wallet_name_testwallet_key.dat | cut -d' ' -f1)
#----------------------
CMD=$( $GLOBALPATH/bin/cleos.sh set account permission $NAME owner $PUB_KEY -p $NAME@owner 2>$tpm_stderr)

ERR=$(cat $tpm_stderr)

if [[ $ERR != *"executed transaction"* ]]; then
    failed "$ERR"
    rm $tpm_stderr;
    exit 1;
fi
CMD2=$( $GLOBALPATH/bin/cleos.sh get account $NAME | grep owner | grep $PUB_KEY>$tpm_stderr)
ERR=$(cat $tpm_stderr)
if [[ -z "$ERR" ]]; then
    failed "$ERR"
    rm $tpm_stderr;
else
    echo "1:$TEST_NAME" && sleep 2
fi
