TEST_NAME="Unapprove producer (vote)"

. ../runner.sh

NAME="$( jq -r '.test_account_name' "$config" )"

#----------------------
sleep 1;

CMD2=$( sleep 1 && $GLOBALPATH/bin/cleos.sh system listproducers | grep testaccountu -A0 | sed 's/[^0-9]*//g'>$tpm_stderr_2)
VAL_OLD=$(cat $tpm_stderr_2)
CMD=$( sleep 1 && $GLOBALPATH/bin/cleos.sh system voteproducer unapprove $NAME testaccountu -f 2>$tpm_stderr)
ERR=$(cat $tpm_stderr)
if [[ $ERR != *"executed transaction"* ]]; then
    failed "$ERR"
    rm $tpm_stderr;
    exit 1
fi
CMD3=$( sleep 1 && $GLOBALPATH/bin/cleos.sh system listproducers | grep testaccountu -A0 | sed 's/[^0-9]*//g'>$tpm_stderr)
VAL_NEW=$(cat $tpm_stderr)
  if [[ $VAL_OLD -eq $VAL_NEW ]]; then
    failed "Vote was not updated"
    rm $tpm_stderr;
    rm $tpm_stderr_2;
    exit 1;
  fi
echo "1:$TEST_NAME"

