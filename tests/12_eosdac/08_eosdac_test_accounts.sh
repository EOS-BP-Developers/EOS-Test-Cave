TEST_NAME="Create test producer accounts"

. ../runner.sh

NAME="$( jq -r '.test_account_name' "$config" )"
PUB_KEY=$( cat $GLOBALPATH/log/wallet_name_testwallet_key.dat | cut -d' ' -f1)
#----------------------

for x in {a..z}
do
  CUST="eosdaccusta$x"
  CMD=$( $GLOBALPATH/bin/cleos.sh system newaccount $NAME $CUST $PUB_KEY --stake-net "1000.0000 EOS" --stake-cpu "1000.0000 EOS" --buy-ram-kbytes 1024 --transfer 2>$tpm_stderr)
  ERR=$(cat $tpm_stderr)
  if [[ $ERR != *"executed transaction"* ]]; then
    failed "$ERR"
    rm $tpm_stderr;
    exit 1;
  fi
done

echo "1:$TEST_NAME"

