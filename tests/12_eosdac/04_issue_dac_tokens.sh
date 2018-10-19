TEST_NAME="Issue dac tokens"

. ../runner.sh

KEY="$( jq -r '.eosio_pub_key' "$config" )"

#----------------------

CMD=$( $GLOBALPATH/bin/cleos.sh push action eosdactokens issue '["eosdactokens", "1000000000.0000 EOSDAC", "initial issuance"]' -p eosdactokens 2>$tpm_stderr)

ERR=$(cat $tpm_stderr)

VALUE="$($GLOBALPATH/bin/cleos.sh get currency stats eosdactokens EOSDAC | /bin/grep '"supply":' | sed 's/[^0-9]*//g')"

if [[ $ERR != *"executed transaction"* ]]; then
    failed "$ERR"
    rm $tpm_stderr;
elif [[ $VALUE != "10000000000000" ]]; then
    failed "Wrong supply"
    rm $tpm_stderr;
else
    echo "1:$TEST_NAME"
fi
