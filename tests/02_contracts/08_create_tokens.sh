TEST_NAME="Create tokens"

. ../runner.sh

JQ=$(command -v jq)
GREP=$( command -v grep )
SED=$( command -v sed )

KEY="$( $JQ -r '.eosio_pub_key' "$config" )"

#----------------------

CMD=$( $GLOBALPATH/bin/cleos.sh push action eosio.token create '["eosio", "10000000000.0000 EOS"]' -p eosio.token 2>$tpm_stderr)

ERR=$(cat $tpm_stderr)

VALUE="$($GLOBALPATH/bin/cleos.sh get currency stats eosio.token EOS | $GREP max_supply | $SED 's/[^0-9]*//g')"

if [[ $ERR != *"executed transaction"* ]]; then
    failed "$ERR"
    rm $tpm_stderr;
elif [[ $VALUE != "100000000000000" ]]; then
    failed "Wrong max supply"
    rm $tpm_stderr;
else
    echo "1:$TEST_NAME"
fi
