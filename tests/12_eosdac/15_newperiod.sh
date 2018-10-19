TEST_NAME="New period"

. ../runner.sh

KEY="$( jq -r '.eosio_pub_key' "$config" )"

#----------------------

CUST="eosdaccustab"

CMD=$( $GLOBALPATH/bin/cleos.sh push action daccustodian newperiod '["The first period of the first EOS DAC to be created by man (and woman) kind."]' -p eosdaccustab 2>$tpm_stderr)

VALUE="$($GLOBALPATH/bin/cleos.sh get table daccustodian daccustodian custodians -l 100000 | /bin/grep $CUST)"

ERR=$(cat $tpm_stderr)

if [[ $ERR != *"executed transaction"* ]]; then
    failed "$ERR"
    rm $tpm_stderr;
elif [[ $VALUE != *"$CUST"* ]]; then
    failed "Account not added to the table"
    rm $tpm_stderr;
else
    echo "1:$TEST_NAME"
fi
