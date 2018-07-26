TEST_NAME="Create B1 account"

. ../runner.sh

#----------------------
PUB_KEY=$( cat $GLOBALPATH/log/wallet_default_key.dat | cut -d' ' -f1)
CMD=$( $GLOBALPATH/bin/cleos.sh create account eosio b1 EOS5cujNHGMYZZ2tgByyNEUaoPLFhZVmGXbZc9BLJeQkKZFqGYEiQ 2>$tpm_stderr)

ERR=$(cat $tpm_stderr)

if [[ $ERR != *"executed transaction"* ]]; then
    failed "$ERR"
    rm $tpm_stderr;
else
    echo "1:$TEST_NAME"
fi
