TEST_NAME="Issue tokens"

. ../runner.sh

KEY="$( jq -r '.eosio_pub_key' "$config" )"

#----------------------

CMD=$( sleep 1 && $GLOBALPATH/bin/cleos.sh push action eosio.token issue '["eosio", "1000000000.0000 EOS", "initial issuance"]' -p eosio 2>$tpm_stderr)

ERR=$(cat $tpm_stderr)

VALUE="$($GLOBALPATH/bin/cleos.sh get currency stats eosio.token EOS | /bin/grep '"supply":' | sed 's/[^0-9]*//g')"

if [[ $ERR != *"executed transaction"* ]]; then
    failed "$ERR"
    rm $tpm_stderr;
elif [[ $VALUE != "10000000000000" ]]; then
    failed "Wrong supply"
    rm $tpm_stderr;
else
    echo "1:$TEST_NAME"
fi
