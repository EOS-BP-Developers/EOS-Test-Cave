TEST_NAME="Get system accounts info"

. ../runner.sh

KEY="$( jq -r '.eosio_pub_key' "$config" )"

#----------------------

accounts=( eosio.bpay eosio.msig eosio.names eosio.ram eosio.ramfee eosio.saving eosio.stake eosio.token eosio.vpay );

for account in "${accounts[@]}"
do
  CMD=$( sleep 1 && $GLOBALPATH/bin/cleos.sh get account $account 2>$tpm_stderr)
  ERR=$(cat $tpm_stderr)
  if [[ $ERR != "" ]]; then
    failed "$ERR"
    rm $tpm_stderr;
    exit 1;
  fi
done

echo "1:$TEST_NAME"

