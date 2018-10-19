TEST_NAME="Create tokens"

. ../runner.sh

KEY="$( jq -r '.eosio_pub_key' "$config" )"

#----------------------

CMD=$( $GLOBALPATH/bin/cleos.sh push action eosdactokens create '["eosdactokens", "10000000000.0000 EOSDAC", 0]' -p eosdactokens 2>$tpm_stderr)

ERR=$(cat $tpm_stderr)

VALUE="$($GLOBALPATH/bin/cleos.sh get currency stats eosdactokens EOSDAC | /bin/grep max_supply | /bin/sed 's/[^0-9]*//g')"

if [[ $ERR != *"executed transaction"* ]]; then
    failed "$ERR"
    rm $tpm_stderr;
elif [[ $VALUE != "100000000000000" ]]; then
    failed "Wrong max supply"
    rm $tpm_stderr;
else
    echo "1:$TEST_NAME"
fi
