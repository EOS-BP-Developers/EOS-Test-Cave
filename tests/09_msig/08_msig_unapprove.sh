TEST_NAME="Multisig Propose unapprove sign"

. ../runner.sh

# Usage: cleos multisig approve [OPTIONS] proposer proposal_name permissions
#../../bin/cleos.sh multisig approve msigconfirm3 testmultisig '{"actor":"msigconfirm1", "permission":"active"}' -p msigconfirm1@active
sleep 1
accounts=( testmultisig msigconfirm1 msigconfirm2 msigconfirm3 );
NAME=${accounts[0]}
proposer=${accounts[${#accounts[@]}-1]}
unapprove=${accounts[2]}

CMD=$( $GLOBALPATH/bin/cleos.sh multisig unapprove $proposer $NAME '{"actor":"'${unapprove}'","permission":"active"}' -p ${unapprove}@active 2> $tpm_stderr )
ERR=$(cat $tpm_stderr)
if [[ $ERR != *"executed transaction"* ]]; then
  failed "$ERR"
  rm $tpm_stderr;
  exit 1;
fi
echo "1:$TEST_NAME" && sleep 2
