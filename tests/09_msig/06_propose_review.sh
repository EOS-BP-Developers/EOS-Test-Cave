TEST_NAME="Multisig Propose Review"

. ../runner.sh

# Usage: cleos multisig review [OPTIONS] proposer proposal_name
accounts=( testmultisig msigconfirm1 msigconfirm2 msigconfirm3 );
NAME=${accounts[0]}
#----------------------
# get variable on end of accounts array
proposer=${accounts[${#accounts[@]}-1]}
sleep 1;
CMD=$( $GLOBALPATH/bin/cleos.sh multisig review ${proposer} $NAME 2> $tpm_stderr | jq -r .proposal_name )
ERR=$(cat $tpm_stderr)
if [[ $CMD != "$NAME" ]]; then
  failed "$ERR"
  rm $tpm_stderr
  exit 1;
fi
echo "1:$TEST_NAME"
