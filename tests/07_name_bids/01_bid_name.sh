TEST_NAME="Bid name"

. ../runner.sh

NAME="$( jq -r '.test_account_name' "$config" )"
#----------------------

  CMD2=$( $GLOBALPATH/bin/cleos.sh get currency balance eosio.token $NAME | sed 's/[^0-9]*//g'>$tpm_stderr_2)
  VAL_OLD=$(cat $tpm_stderr_2)
  CMD=$( $GLOBALPATH/bin/cleos.sh system bidname $NAME eos "1.0000 EOS" -p $NAME 2>$tpm_stderr)
  ERR=$(cat $tpm_stderr)
  if [[ $ERR != *"executed transaction"* ]]; then
    failed "$ERR"
    rm $tpm_stderr;
    exit 1;
  fi
  CMD3=$( $GLOBALPATH/bin/cleos.sh get currency balance eosio.token $NAME | sed 's/[^0-9]*//g'>$tpm_stderr)
  VAL_NEW=$(cat $tpm_stderr)
  if [[ $VAL_OLD -eq $VAL_NEW ]]; then
    failed "Balance was not updated"
    rm $tpm_stderr;
    rm $tpm_stderr_2;
    exit 1;
  fi
  CMD4=$( $GLOBALPATH/bin/cleos.sh system bidnameinfo eos | grep $NAME -A0 | sed -e 's/://g'>$tpm_stderr)
  STRING=$(cat $tpm_stderr)
  if [[ -z "$STRING" ]]; then
    failed "Bid was not updated"
    rm $tpm_stderr;
    exit 1;
  fi

echo "1:$TEST_NAME"
