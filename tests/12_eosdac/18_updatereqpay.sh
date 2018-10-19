TEST_NAME="Update requested pay"

. ../runner.sh

#----------------------

CUST="eosdaccustaj"

  CMD2=$( $GLOBALPATH/bin/cleos.sh get table daccustodian daccustodian candidates -L $CUST -l 1 | grep requestedpay | sed 's/[^0-9]*//g'>$tpm_stderr_2)
  VAL_OLD=$(cat $tpm_stderr_2)
  CMD=$( $GLOBALPATH/bin/cleos.sh push action daccustodian updatereqpay '["'$CUST'", "30.0000 EOS"]' -p $CUST 2>$tpm_stderr)
  ERR=$(cat $tpm_stderr)
  if [[ $ERR != *"executed transaction"* ]]; then
    failed "$ERR"
    rm $tpm_stderr;
    exit 1;
  fi
  CMD3=$( $GLOBALPATH/bin/cleos.sh get table daccustodian daccustodian candidates -L $CUST -l 1 | grep requestedpay | sed 's/[^0-9]*//g'>$tpm_stderr)
  VAL_NEW=$(cat $tpm_stderr)
  if [[ "$VAL_OLD" == "$VAL_NEW" ]]; then
    failed "Balance was not updated"
    rm $tpm_stderr;
    rm $tpm_stderr_2;
    exit 1;
  fi

echo "1:$TEST_NAME"
