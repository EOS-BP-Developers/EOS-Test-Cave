TEST_NAME="Claim pay"

. ../runner.sh

KEY="$( jq -r '.eosio_pub_key' "$config" )"

#----------------------


ACC="eosdaccustab"

CMD=$( $GLOBALPATH/bin/cleos.sh push action daccustodian claimpay '[1]' -p $ACC 2>$tpm_stderr)

VALUE="$($GLOBALPATH/bin/cleos.sh get table daccustodian daccustodian pendingpay -l 100000 | /bin/grep $ACC)"

ERR=$(cat $tpm_stderr)

if [[ $ERR != *"executed transaction"* ]]; then
    failed "$ERR"
    rm $tpm_stderr;
elif ! [ -z "$VALUE" ]; then
    failed "Account was not removed from the pending pay table"
    rm $tpm_stderr;
else
    echo "1:$TEST_NAME"
fi
