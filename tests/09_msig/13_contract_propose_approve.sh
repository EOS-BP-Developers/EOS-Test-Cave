TEST_NAME="Contract update multisig approve"

. ../runner.sh

# Usage: cleos multisig review [OPTIONS] proposer proposal_name
accounts=( testaccounta testaccountb testaccountc testaccountd testaccounte testaccountf testaccountg testaccounth testaccounti testaccountj testaccountk testaccountl testaccountm testaccountn testaccounto testaccountp testaccountq testaccountr testaccounts testaccountt testaccountu testaccountv );

propose_name="systemupdate"
#----------------------
# get variable on end of accounts array
proposer=${accounts[${#accounts[@]}-1]}


for((x=1;x<16;x++)); do
  account=${accounts[$x]}
  #CMD=$( $GLOBALPATH/bin/cleos.sh multisig review ${proposer} ${propose_name} 2> $tpm_stderr | jq -r .proposal_name )
  CMD=$( $GLOBALPATH/bin/cleos.sh  multisig approve ${proposer} ${propose_name} '{"actor":"'$account'","permission":"active"}' -p $account@active 2> $tpm_stderr)
  ERR=$(cat $tpm_stderr)
  if [[ $ERR != *"executed transaction"* ]]; then
    failed "$ERR"
    rm $tpm_stderr
    exit 1;
  fi
done
echo "1:$TEST_NAME" && sleep 2
