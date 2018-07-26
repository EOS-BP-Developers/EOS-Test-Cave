TEST_NAME="Simple Transfer Multi Signature Propose"

. ../runner.sh

# multisig propose [OPTIONS] proposal_name requested_permissions trx_permissions contract action data [proposer] [proposal_expiration]

accounts=( testmultisig msigconfirm1 msigconfirm2 msigconfirm3 );
NAME=${accounts[0]}
msig_json="$GLOBALPATH/log/tmp_msig.json"
echo '[' > $msig_json
#----------------------
for((x=1;x<=3;x++)); do
  CONFIRMER=${accounts[$x]}
  if [ $x -eq 3 ]; then
    echo '  {"actor":"'$CONFIRMER'","permission":"active"}]' >> $msig_json
  else
    echo '  {"actor":"'$CONFIRMER'","permission":"active"},' >> $msig_json
  fi
done

CMD=$( $GLOBALPATH/bin/cleos.sh multisig propose testmultisig "$(cat $msig_json)" '[{"actor": "'$NAME'", "permission": "active"}]' eosio.token transfer '{"from":"'$NAME'", "to":"'$CONFIRMER'", "quantity":"25.0000 EOS", "memo":"transfer test with multi signature confirm"}' -p ${CONFIRMER}@active 2> ${tpm_stderr} )

ERR=$(cat $tpm_stderr)
if [[ $ERR != *"executed transaction"* ]]; then
  failed "$ERR"
  rm $tpm_stderr;
  exit 1;
fi
echo "1:$TEST_NAME"
