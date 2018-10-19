TEST_NAME="Distribute DAC tokens"

. ../runner.sh

#----------------------

NAME="eosdactokens"

for x in {a..z}
do
  CUST="eosdaccusta$x"
  CMD2=$( $GLOBALPATH/bin/cleos.sh get currency balance eosdactokens $CUST | sed 's/[^0-9]*//g'>$tpm_stderr_2)
  VAL_OLD=$(cat $tpm_stderr_2)
  CMD=$( $GLOBALPATH/bin/cleos.sh transfer -c eosdactokens $NAME $CUST "150000.0000 EOSDAC" "free tokens" -p $NAME 2>$tpm_stderr)
  ERR=$(cat $tpm_stderr)
  if [[ $ERR != *"executed transaction"* ]]; then
    failed "$ERR"
    rm $tpm_stderr;
    exit 1;
  fi
  CMD3=$( $GLOBALPATH/bin/cleos.sh get currency balance eosdactokens $CUST | sed 's/[^0-9]*//g'>$tpm_stderr)
  VAL_NEW=$(cat $tpm_stderr)
  if [[ "$VAL_OLD" == "$VAL_NEW" ]]; then
    failed "Balance was not updated"
    rm $tpm_stderr;
    rm $tpm_stderr_2;
    exit 1;
  fi
done

echo "1:$TEST_NAME"
