TEST_NAME="Execute Approved Contract Update msig TRX"

. ../runner.sh

# Usage: cleos multisig exec [OPTIONS] proposer proposal_name [executer]
accounts=( testaccounta testaccountb testaccountc testaccountd testaccounte testaccountf testaccountg testaccounth testaccounti testaccountj testaccountk testaccountl testaccountm testaccountn testaccounto testaccountp testaccountq testaccountr testaccounts testaccountt testaccountu testaccountv );

# get variable on end of accounts array
propose_name="systemupdate"
proposer=${accounts[${#accounts[@]}-1]}
executer=${accounts[$RANDOM%21]}
#----------------------
cur_code_hash=$( sleep 1 && $GLOBALPATH/bin/cleos.sh get code eosio  2> $tpm_stderr | awk '{print $3}' )

CMD=$( sleep 1 && $GLOBALPATH/bin/cleos.sh multisig exec $proposer $propose_name -p ${executer}@active 2> $tpm_stderr )
ERR=$(cat $tpm_stderr)
if [[ $ERR != *"executed transaction"* ]]; then
  failed "$ERR"
  rm $tpm_stderr;
  exit 1;
fi
sleep 1;

CMD=$( sleep 1 && $GLOBALPATH/bin/cleos.sh get code eosio 2> $tpm_stderr | awk '{print $3}' )
ERR=$(cat $tpm_stderr)
if [[ $ERR != "" ]]; then
  failed "$ERR"
  rm $tpm_stderr;
  exit 1;
elif [[ $CMD == $cur_code_hash ]]; then
  failed "eosio.system Contract update failed."
  rm $tpm_stderr;
  exit 1;
fi

echo "1:$TEST_NAME"
