TEST_NAME="Un-delegate bandwidth"

. ../runner.sh

#----------------------

accounts=( testaccounta testaccountb testaccountc testaccountd testaccounte testaccountf testaccountg testaccounth testaccounti testaccountj testaccountk testaccountl testaccountm testaccountn testaccounto testaccountp testaccountq testaccountr testaccounts testaccountt testaccountu testaccountv );
for account in "${accounts[@]}"
do
  CMD2=$( sleep 1 && $GLOBALPATH/bin/cleos.sh get currency balance eosio.token $account | sed 's/[^0-9]*//g'>$tpm_stderr_2)
  VAL_OLD=$(cat $tpm_stderr_2)
  CMD=$( sleep 1 && $GLOBALPATH/bin/cleos.sh system undelegatebw $account $account "0.0010 EOS" "0.0010 EOS" -p $account 2>$tpm_stderr)
  ERR=$(cat $tpm_stderr)
  if [[ $ERR != *"executed transaction"* ]]; then
    failed "$ERR"
    rm $tpm_stderr;
    exit 1;
  fi
  CMD3=$( sleep 1 && $GLOBALPATH/bin/cleos.sh get currency balance eosio.token $account | sed 's/[^0-9]*//g'>$tpm_stderr)
  VAL_NEW=$(cat $tpm_stderr)
  if [[ $VAL_OLD != $VAL_NEW ]]; then
    failed "Balanced changed. Undelegate timer might not have worked."
    rm $tpm_stderr;
    rm $tpm_stderr_2;
    exit 1;
  fi
done

echo "1:$TEST_NAME"
