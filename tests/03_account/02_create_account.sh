TEST_NAME="Create genesisblock account and transfer liquid tokens to it"

. ../runner.sh

NAME="$( jq -r '.abp_account_name' "$config" )"

#----------------------
PUB_KEY=$( cat $GLOBALPATH/log/wallet_default_key.dat | cut -d' ' -f1)
CMD=$( $GLOBALPATH/bin/cleos.sh system newaccount eosio $NAME $PUB_KEY --stake-net "80000000.0000 EOS" --stake-cpu "80000000.0000 EOS" --buy-ram "10.0000 EOS" --transfer 2>$tpm_stderr)

ERR=$(cat $tpm_stderr)

if [[ $ERR != *"executed transaction"* ]]; then
    failed "$ERR"
    rm $tpm_stderr;
    exit 1;
fi
CMD2=$( $GLOBALPATH/bin/cleos.sh transfer eosio $NAME "50000000.0000 EOS" "liquid tokens" 2>$tpm_stderr)
ERR=$(cat $tpm_stderr)
if [[ $ERR != *"executed transaction"* ]]; then
    failed "$ERR"
    rm $tpm_stderr;
else
    echo "1:$TEST_NAME"
fi
