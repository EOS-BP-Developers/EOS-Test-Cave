TEST_NAME="Register producers"

. ../runner.sh

NAME="$( jq -r '.test_account_name' "$config" )"
SIGNING_KEY="$( jq -r '.signing_key' "$config" )"
#----------------------

accounts=( testaccounta testaccountb testaccountc testaccountd testaccounte testaccountf testaccountg testaccounth testaccounti testaccountj testaccountk testaccountl testaccountm testaccountn testaccounto testaccountp testaccountq testaccountr testaccounts testaccountt testaccountu testaccountv );

for account in "${accounts[@]}"
do
  CMD=$( $GLOBALPATH/bin/cleos.sh system regproducer $account $SIGNING_KEY -p $account 2>$tpm_stderr)
  ERR=$(cat $tpm_stderr)
  if [[ $ERR != *"executed transaction"* ]]; then
    failed "$ERR"
    rm $tpm_stderr;
    exit 1;
  fi
  CMD2=$( $GLOBALPATH/bin/cleos.sh system listproducers | grep $account>$tpm_stderr)
  ERR=$(cat $tpm_stderr)
  if [[ $ERR != *"$account"* ]]; then
    failed "$ERR"
    rm $tpm_stderr;
    exit 1;
  fi
done

echo "1:$TEST_NAME"
