TEST_NAME="Register a proxy"

. ../runner.sh

NAME="$( jq -r '.test_account_name' "$config" )"

#----------------------
CMD=$( sleep 1 && $GLOBALPATH/bin/cleos.sh system regproxy $NAME -p $NAME 2>$tpm_stderr)

ERR=$(cat $tpm_stderr)

if [[ $ERR != *"executed transaction"* ]]; then
    failed "$ERR"
    rm $tpm_stderr;
else
    echo "1:$TEST_NAME"
fi
