TEST_NAME="Vote proxy"

. ../runner.sh

NAME="$( jq -r '.test_account_name' "$config" )"
#----------------------
PREP_1=$( sleep 1 && $GLOBALPATH/bin/cleos.sh transfer $NAME testaccounta "3000000.0000 EOS" -p $NAME 2>$tpm_stderr)
PREP_2=$( sleep 1 && $GLOBALPATH/bin/cleos.sh system delegatebw testaccounta testaccounta "1500000.0000 EOS" "1500000.0000 EOS" -p testaccounta 2>$tpm_stderr)
CMD2=$( sleep 1 && $GLOBALPATH/bin/cleos.sh system listproducers | grep testaccountb -A0 | sed 's/[^0-9]*//g'>$tpm_stderr_2)
VAL_OLD=$(cat $tpm_stderr_2)
CMD=$( sleep 1 && $GLOBALPATH/bin/cleos.sh system voteproducer proxy testaccounta $NAME -p testaccounta 2>$tpm_stderr)
ERR=$(cat $tpm_stderr)
if [[ $ERR != *"executed transaction"* ]]; then
    failed "$ERR"
    rm $tpm_stderr;
    exit 1
fi
CMD3=$( sleep 1 && $GLOBALPATH/bin/cleos.sh system listproducers | grep testaccountb -A0 | sed 's/[^0-9]*//g'>$tpm_stderr)
VAL_NEW=$(cat $tpm_stderr)
  if [[ $VAL_OLD -eq $VAL_NEW ]]; then
    failed "Vote was not updated"
    rm $tpm_stderr;
    rm $tpm_stderr_2;
    exit 1;
  fi
echo "1:$TEST_NAME"

