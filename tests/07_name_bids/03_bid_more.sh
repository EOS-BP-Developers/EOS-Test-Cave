TEST_NAME="Bid more on jae name"

. ../runner.sh

#----------------------
NAME=testaccounta
OTHER_NAME=testaccount1

  CMD2=$( $GLOBALPATH/bin/cleos.sh get currency balance eosio.token $NAME | sed 's/[^0-9]*//g'>$tpm_stderr_2)
  VAL_OLD=$(cat $tpm_stderr_2)
  CMD5=$( $GLOBALPATH/bin/cleos.sh get currency balance eosio.token $OTHER_NAME | sed 's/[^0-9]*//g'>$tpm_stderr_3)
  VAL_OLD_2=$(cat $tpm_stderr_3)
  CMD=$( $GLOBALPATH/bin/cleos.sh system bidname $NAME jae '10.0000 EOS' -p $NAME 2>$tpm_stderr)
  ERR=$(cat $tpm_stderr)
  if [[ $ERR != *"executed transaction"* ]]; then
    failed "$ERR"
    rm $tpm_stderr;
    exit 1;
  fi
  CMD3=$( $GLOBALPATH/bin/cleos.sh get currency balance eosio.token $NAME | sed 's/[^0-9]*//g'>$tpm_stderr)
  VAL_NEW=$(cat $tpm_stderr)
  CMD6=$( $GLOBALPATH/bin/cleos.sh get currency balance eosio.token $OTHER_NAME | sed 's/[^0-9]*//g'>$tpm_stderr_4)
  VAL_NEW_2=$(cat $tpm_stderr_4)
  if [[ $VAL_OLD -eq $VAL_NEW ]]; then
    failed "Balance was not updated"
    rm $tpm_stderr;
    rm $tpm_stderr_2;
    rm $tpm_stderr_3;
    rm $tpm_stderr_4;
    exit 1;
  fi
  if [[ $VAL_OLD_2 -eq $VAL_NEW_2 ]]; then
    failed "Balance was not updated"
    rm $tpm_stderr;
    rm $tpm_stderr_2;
    rm $tpm_stderr_3;
    rm $tpm_stderr_4;
    exit 1;
  fi
  CMD4=$( $GLOBALPATH/bin/cleos.sh system bidnameinfo jae | grep $NAME>$tpm_stderr)
  STRING=$(cat $tpm_stderr)
  if [[ -z "$STRING" ]]; then
    failed "Bid was not updated"
    rm $tpm_stderr;
    exit 1;
  fi

echo "1:$TEST_NAME"
