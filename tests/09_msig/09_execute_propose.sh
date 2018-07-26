TEST_NAME="Execute Approved Multisign Transation"

. ../runner.sh

# Usage: cleos multisig exec [OPTIONS] proposer proposal_name [executer]

accounts=( testmultisig msigconfirm1 msigconfirm2 msigconfirm3 );
NAME=${accounts[0]}
proposer=${accounts[${#accounts[@]}-1]}
executer=${accounts[1]}

CMD=$( $GLOBALPATH/bin/cleos.sh multisig exec $proposer $NAME -p ${executer}@active 2> $tpm_stderr )
ERR=$(cat $tpm_stderr)
if [[ $ERR != *"executed transaction"* ]]; then
  failed "$ERR"
  rm $tpm_stderr;
  exit 1;
fi
sleep 1;
CMD=$( $GLOBALPATH/bin/cleos.sh get currency balance eosio.token msigconfirm3 EOS | awk '{print $1}' | sed "s/\.//g" 2> $tpm_stderr )
ERR=$(cat $tpm_stderr)
if [[ $ERR != "" ]]; then
  failed "$ERR"
  rm $tpm_stderr;
  exit 1;
elif [[ $CMD -ne 10250000 ]]; then
  failed "msigconfirm3 account balance is not right. maybe multisig execute is not work."
  rm $tpm_stderr;
  exit 1;
fi

echo "1:$TEST_NAME"
