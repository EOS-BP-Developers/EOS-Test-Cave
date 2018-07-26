TEST_NAME="Contract update propose review (bug - ref_issue:4395)"

. ../runner.sh

# Usage: cleos multisig review [OPTIONS] proposer proposal_name
accounts=( testaccounta testaccountb testaccountc testaccountd testaccounte testaccountf testaccountg testaccounth testaccounti testaccountj testaccountk testaccountl testaccountm testaccountn testaccounto testaccountp testaccountq testaccountr testaccounts testaccountt testaccountu testaccountv );

propose_name="systemupdate"
#----------------------
# get variable on end of accounts array
proposer=${accounts[${#accounts[@]}-1]}

CMD=$( sleep 1 && $GLOBALPATH/bin/cleos.sh multisig review ${proposer} ${propose_name} 2> $tpm_stderr | jq -r .proposal_name )
ERR=$(cat $tpm_stderr)
if [[ $CMD != "$propose_name" ]]; then
  failed "$ERR"
  rm $tpm_stderr
  exit 1;
fi
echo "1:$TEST_NAME"
