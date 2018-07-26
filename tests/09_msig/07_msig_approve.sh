TEST_NAME="Multisig Propose Approve sign"

. ../runner.sh

# Usage: cleos multisig approve [OPTIONS] proposer proposal_name permissions
#../../bin/cleos.sh multisig approve msigconfirm3 testmultisig '{"actor":"msigconfirm1", "permission":"active"}' -p msigconfirm1@active

accounts=( testmultisig msigconfirm1 msigconfirm2 msigconfirm3 );
NAME=${accounts[0]}
proposer=${accounts[${#accounts[@]}-1]}

for((x=1;x<${#accounts[@]};x++)); do
  CMD=$( $GLOBALPATH/bin/cleos.sh multisig approve $proposer $NAME '{"actor":"'${accounts[$x]}'","permission":"active"}' -p ${accounts[$x]}@active 2>$tpm_stderr )
  ERR=$(cat $tpm_stderr)
  if [[ $ERR != *"executed transaction"* ]]; then
    failed "${accounts[$x]} - $ERR"
    rm $tpm_stderr;
    exit 1;
  fi
done
echo "1:$TEST_NAME"
