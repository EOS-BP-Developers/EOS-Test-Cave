TEST_NAME="Withdraw candidate"

. ../runner.sh

KEY="$( jq -r '.eosio_pub_key' "$config" )"

#----------------------
CUST="eosdaccustaa"

CMD=$( $GLOBALPATH/bin/cleos.sh push action daccustodian withdrawcand '["'$CUST'"]' -p $CUST 2>$tpm_stderr)

ERR=$(cat $tpm_stderr)

VALUE="$($GLOBALPATH/bin/cleos.sh get table daccustodian daccustodian candidates -l 10000 | grep eosdaccustaa -A4 | grep is_active)"

if [[ $ERR != *"executed transaction"* ]]; then
    failed "$ERR"
    rm $tpm_stderr;
elif [[ $VALUE != *"0"* ]]; then
    failed "Custodian is still active"
    rm $tpm_stderr;
else
    echo "1:$TEST_NAME"
fi

