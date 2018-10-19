TEST_NAME="New period 2"

. ../runner.sh

KEY="$( jq -r '.eosio_pub_key' "$config" )"

#----------------------

sleep 60;

ACC="eosdaccustaa"

CMD=$( $GLOBALPATH/bin/cleos.sh push action daccustodian newperiod '["The second period of the first EOS DAC to be created by man (and woman) kind."]' -p eosdaccustab 2>$tpm_stderr)

VALUE="$($GLOBALPATH/bin/cleos.sh get table daccustodian daccustodian custodians -l 100000 | /bin/grep $ACC)"

VALUE_2="$($GLOBALPATH/bin/cleos.sh get table daccustodian daccustodian pendingpay -l 100000 | /bin/grep $ACC)"

ERR=$(cat $tpm_stderr)

if [[ $ERR != *"executed transaction"* ]]; then
    failed "$ERR"
    rm $tpm_stderr;
elif ! [ -z "$VALUE" ]; then
    failed "Withdraw candidate didn't work"
    rm $tpm_stderr;
elif [[ $VALUE_2 != *"$ACC"* ]]; then
    failed "Account not added to the table"
    rm $tpm_stderr;
else
    echo "1:$TEST_NAME"
fi
