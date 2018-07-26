TEST_NAME="Generate set contract update json data"

. ../runner.sh

# Usage: cleos multisig exec [OPTIONS] proposer proposal_name [executer]

NAME="eosio"
msig_json="$GLOBALPATH/log/tmp_msig_data.json"
msig_json_tmp="$GLOBALPATH/log/tmp_msig_data.tmp"

CMD=$(echo -n $($GLOBALPATH/bin/cleos.sh set contract $NAME $GLOBALPATH/contracts_update/eosio.system  -p ${NAME}@active -d -j -s 2> $tpm_stderr) > $msig_json_tmp)
if [ $(grep "Publishing contract" $msig_json_tmp | wc -l) -ne 0 ];
then
  CMD=$(cat $msig_json_tmp | awk -F"contract\.\.\.\ " '{print $2}' 2> $tpm_stderr  > $msig_json)
else
  CMD=$(cp -a $msig_json_tmp $msig_json 2> $tpm_stderr)
fi

ERR=$(cat $tpm_stderr)
if [[ $ERR != "" ]]; then
  failed "$ERR"
  rm $tpm_stderr;
  exit 1;
fi

echo "1:$TEST_NAME"
