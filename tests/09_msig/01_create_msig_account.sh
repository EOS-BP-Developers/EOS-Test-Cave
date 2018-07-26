TEST_NAME="Create msig account for multisig test"

. ../runner.sh

accounts=( testmultisig msigconfirm1 msigconfirm2 msigconfirm3 );

#----------------------
PUB_KEY=$( cat $GLOBALPATH/log/wallet_name_testwallet_key.dat | cut -d' ' -f1)
for NAME in "${accounts[@]}"; do
  CMD=$( $GLOBALPATH/bin/cleos.sh system newaccount eosio $NAME $PUB_KEY --stake-net "10.0000 EOS" --stake-cpu "10.0000 EOS" --buy-ram "1.0000 EOS" --transfer 2>$tpm_stderr )
  ERR=$(cat $tpm_stderr)
  if [[ $ERR != *"executed transaction"* ]]; then
      failed "$ERR"
      rm $tpm_stderr;
      exit 1
  fi

  CMD=$( $GLOBALPATH/bin/cleos.sh transfer eosio $NAME "10.0000 EOS" "msig test tokens" -p eosio 2>$tpm_stderr )
  ERR=$(cat $tpm_stderr)
  if [[ $ERR != *"executed transaction"* ]]; then
    failed "$ERR"
    rm $tpm_stderr;
    exit 1;
  fi
done
echo "1:$TEST_NAME"
