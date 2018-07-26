TEST_NAME="Get test producer accounts info"

. ../runner.sh

KEY="$( jq -r '.eosio_pub_key' "$config" )"

#----------------------

accounts=( testaccounta testaccountb testaccountc testaccountd testaccounte testaccountf testaccountg testaccounth testaccounti testaccountj testaccountk testaccountl testaccountm testaccountn testaccounto testaccountp testaccountq testaccountr testaccounts testaccountt testaccountu testaccountv );

for account in "${accounts[@]}"
do
  CMD=$( $GLOBALPATH/bin/cleos.sh get account $account 2>$tpm_stderr)
  ERR=$(cat $tpm_stderr)
  if [[ $ERR != "" ]]; then
    failed "$ERR"
    rm $tpm_stderr;
    exit 1;
  fi
done

echo "1:$TEST_NAME"

