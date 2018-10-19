
TEST_NAME="Multisig propose fire custodian"

. ../runner.sh

# multisig propose [OPTIONS] proposal_name requested_permissions trx_permissions contract action data [proposer] [proposal_expiration]

msig_json="$GLOBALPATH/log/tmp_msig.json"
echo '[' > $msig_json
#----------------------
for x in {b..m}
do
  CONFIRMER="eosdaccusta$x"
  if [[ $x == m ]]; then
    echo '  {"actor":"'$CONFIRMER'","permission":"active"}]' >> $msig_json
  else
    echo '  {"actor":"'$CONFIRMER'","permission":"active"}' >> $msig_json
  fi
done

CMD=$( $GLOBALPATH/bin/cleos.sh multisig propose firecust $msig_json '[{"actor": "dacauthority", "permission": "med"}]' daccustodian firecust '{"cust": "eosdaccustal"}' -p eosdaccustak@active 2> $tpm_stderr )

ERR=$(cat $tpm_stderr)
if [[ $ERR != *"executed transaction"* ]]; then
  failed "$ERR"
  rm $tpm_stderr;
  exit 1;
fi
echo "1:$TEST_NAME"
