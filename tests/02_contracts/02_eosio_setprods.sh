TEST_NAME="Setprods on eosio"

. ../runner.sh

KEY="$( jq -r '.eosio_pub_key' "$config" )"

#----------------------
CMD=$( $GLOBALPATH/bin/cleos.sh push action eosio setprods '{"schedule":[{"producer_name":"eosio","block_signing_key":"'$KEY'"}]}' -p eosio 2>$tpm_stderr)

ERR=$(cat $tpm_stderr)

if [[ $ERR != *"executed transaction"* ]]; then
    failed "$ERR"
    rm $tpm_stderr;
else
    echo "1:$TEST_NAME"
fi
