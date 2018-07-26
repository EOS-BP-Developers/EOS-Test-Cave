TEST_NAME="Generate contract update propose json"

. ../runner.sh

# multisig propose [OPTIONS] proposal_name requested_permissions trx_permissions contract action data [proposer] [proposal_expiration]

accounts=( testaccounta testaccountb testaccountc testaccountd testaccounte testaccountf testaccountg testaccounth testaccounti testaccountj testaccountk testaccountl testaccountm testaccountn testaccounto testaccountp testaccountq testaccountr testaccounts testaccountt testaccountu testaccountv );

NAME=${accounts[0]}
msig_json="$GLOBALPATH/log/tmp_msig.json"
msig_trx="$GLOBALPATH/log/tmp_msig_trx.json"
propose_name="systemupdate"

#----------------------
echo '[' > $msig_json
for((x=1;x<=21;x++)); do
  CONFIRMER=${accounts[$x]}
  if [ $x -eq 21 ]; then
    echo '  {"actor":"'$CONFIRMER'","permission":"active"}]' >> $msig_json
  else
    echo '  {"actor":"'$CONFIRMER'","permission":"active"},' >> $msig_json
  fi
done
# Make transaction json for push action
echo '{"proposer":"testaccountv","proposal_name":"'$propose_name'","requested":'$(cat $msig_json)',"trx":'$(cat $GLOBALPATH/log/tmp_msig_data.json)'}' | jq . > $msig_trx

CMD=$( $GLOBALPATH/bin/cleos.sh push action eosio.msig propose $msig_trx -p ${CONFIRMER}@active 2> ${tpm_stderr} )

ERR=$(cat $tpm_stderr)
if [[ $ERR != *"executed transaction"* ]]; then
  failed "$ERR"
  rm $tpm_stderr;
  exit 1;
fi
echo "1:$TEST_NAME"
