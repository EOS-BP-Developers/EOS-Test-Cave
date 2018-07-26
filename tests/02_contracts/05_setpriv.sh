TEST_NAME="Set priv msig"

. ../runner.sh

#----------------------
CMD=$( $GLOBALPATH/bin/cleos.sh push action eosio setpriv '["eosio.msig", 1]' -p eosio 2>$tpm_stderr)

ERR=$(cat $tpm_stderr)

if [[ $ERR != *"executed transaction"* ]]; then
    failed "$ERR"
    rm $tpm_stderr;
else
    echo "1:$TEST_NAME" && sleep 2
fi
