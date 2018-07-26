TEST_NAME="Create test producer accounts"

. ../runner.sh

NAME="$( jq -r '.test_account_name' "$config" )"
PUB_KEY=$( cat $GLOBALPATH/log/wallet_name_testwallet_key.dat | cut -d' ' -f1)
#----------------------

accounts=( testaccounta testaccountb testaccountc testaccountd testaccounte testaccountf testaccountg testaccounth testaccounti testaccountj testaccountk testaccountl testaccountm testaccountn testaccounto testaccountp testaccountq testaccountr testaccounts testaccountt testaccountu testaccountv );

for account in "${accounts[@]}"
do
  CMD=$( $GLOBALPATH/bin/cleos.sh system newaccount $NAME $account $PUB_KEY --stake-net "10000.0000 EOS" --stake-cpu "10000.0000 EOS" --buy-ram-kbytes 1024768 --transfer 2>$tpm_stderr)
  ERR=$(cat $tpm_stderr)
  if [[ $ERR != *"executed transaction"* ]]; then
    failed "$ERR"
    rm $tpm_stderr;
    exit 1;
  fi
done

echo "1:$TEST_NAME" && sleep 2

