TEST_NAME="Create system accounts"

. ../runner.sh

KEY="$( jq -r '.eosio_pub_key' "$config" )"

#----------------------

accounts=( eosio.bpay eosio.msig eosio.names eosio.ram eosio.ramfee eosio.saving eosio.stake eosio.token eosio.vpay );

for account in "${accounts[@]}"
do
  CMD=$( sleep 1 && $GLOBALPATH/bin/cleos.sh create account eosio $account $KEY 2>$tpm_stderr)
  ERR=$(cat $tpm_stderr)
  if [[ $ERR != *"executed transaction"* ]]; then
    failed "$ERR"
    rm $tpm_stderr;
    exit 1;
  fi
done

echo "1:$TEST_NAME"

