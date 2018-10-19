TEST_NAME="Create eosdac accounts"

. ../runner.sh

KEY="$( jq -r '.eosio_pub_key' "$config" )"

#----------------------

accounts=(eosdacthedac eosdactokens daccustodian dacauthority);

for account in "${accounts[@]}"
do
  CMD=$( $GLOBALPATH/bin/cleos.sh system newaccount eosio $account $KEY --stake-net "10000.0000 EOS" --stake-cpu "10000.0000 EOS" --buy-ram-kbytes 1024 2>$tpm_stderr)
  ERR=$(cat $tpm_stderr)
  if [[ $ERR != *"executed transaction"* ]]; then
    failed "$ERR"
    rm $tpm_stderr;
    exit 1;
  fi
done

echo "1:$TEST_NAME"

