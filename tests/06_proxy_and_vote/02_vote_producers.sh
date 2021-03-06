TEST_NAME="Vote producers (again)"

. ../runner.sh

NAME="$( jq -r '.test_account_name' "$config" )"

#----------------------

CMD2=$( $GLOBALPATH/bin/cleos.sh system listproducers | grep testaccountb -A0 | sed 's/[^0-9]*//g'>$tpm_stderr_2)
VAL_OLD=$(cat $tpm_stderr_2)
CMD=$( $GLOBALPATH/bin/cleos.sh system voteproducer prods $NAME testaccountb testaccountc testaccountd testaccounte testaccountf testaccountg testaccounth testaccounti testaccountj testaccountk testaccountl testaccountm testaccountn testaccounto testaccountp testaccountq testaccountr testaccounts testaccountt 2>$tpm_stderr)
ERR=$(cat $tpm_stderr)
if [[ $ERR != *"executed transaction"* ]]; then
    failed "$ERR"
    rm $tpm_stderr;
    exit 1
fi
CMD3=$( $GLOBALPATH/bin/cleos.sh system listproducers | grep testaccountb -A0 | sed 's/[^0-9]*//g'>$tpm_stderr)
VAL_NEW=$(cat $tpm_stderr)
  if [[ $VAL_OLD -eq $VAL_NEW ]]; then
    failed "Vote was not updated"
    rm $tpm_stderr;
    rm $tpm_stderr_2;
    exit 1;
  fi
echo "1:$TEST_NAME"

