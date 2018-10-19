
TEST_NAME="Approve multisig proposal"

. ../runner.sh

# multisig propose [OPTIONS] proposal_name requested_permissions trx_permissions contract action data [proposer] [proposal_expiration]

msig_json="$GLOBALPATH/log/tmp_msig.json"
#----------------------
for x in {a..k}
do
  ACC="eosdaccusta$x"
CMD=$( $GLOBALPATH/bin/cleos.sh multisig approve eosdaccustak firecust '{"actor":"'$ACC'","permission":"active"}' -p $ACC@active 2>$tpm_stderr )
  ERR=$(cat $tpm_stderr)
  if [[ $ERR != *"executed transaction"* ]]; then
    failed $ERR
    rm $tpm_stderr;
    exit 1;
  fi
done
echo "1:$TEST_NAME"
