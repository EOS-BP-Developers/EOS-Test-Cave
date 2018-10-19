TEST_NAME="Unstake"

. ../runner.sh

KEY="$( jq -r '.eosio_pub_key' "$config" )"

#----------------------

sleep 10;

ACC="eosdaccustaa"

BAL_OLD="$($GLOBALPATH/bin/cleos.sh get currency balance eosdactokens $ACC)"

CMD=$( $GLOBALPATH/bin/cleos.sh push action daccustodian unstake '["'$ACC'"]' -p $ACC 2>$tpm_stderr)

sleep 5;

BAL_NEXT="$($GLOBALPATH/bin/cleos.sh get currency balance eosdactokens $ACC)"

sleep 6;

BAL_FINAL="$($GLOBALPATH/bin/cleos.sh get currency balance eosdactokens $ACC)"

VALUE="$($GLOBALPATH/bin/cleos.sh get table daccustodian daccustodian candidates -l 100000 | /bin/grep $ACC -A2 | /bin/grep locked_tokens | sed 's/[^0-9]*//g')"


ERR=$(cat $tpm_stderr)

if [[ $ERR != *"executed transaction"* ]]; then
    failed "$ERR"
    rm $tpm_stderr;
elif [[ $VALUE != "00000" ]]; then
    failed "Tokens were not unlocked"
    rm $tpm_stderr;
elif [[ $BAL_OLD != $BAL_NEXT ]]; then
    failed "Time delay failed"
    rm $tpm_stderr;
elif [[ $BAL_NEXT == $BAL_FINAL ]]; then
    failed "Time delay failed"
    rm $tpm_stderr;
else
    echo "1:$TEST_NAME"
fi
