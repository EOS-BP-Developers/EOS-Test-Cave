TEST_NAME="Vote for candidates"

. ../runner.sh

KEY="$( jq -r '.eosio_pub_key' "$config" )"

#----------------------
#for x in {a..z}
#do
  #CUST="eosdaccusta$x"
  #CUST_ACTS+=($CUST)
#done

for x in {a..z}
do
for y in {a..z}
do
VOT="eosdacvote$x$y"

CUST="eosdaccusta$x"
CMD=$($GLOBALPATH/bin/cleos.sh push action daccustodian votecust '["'$VOT'", ["'$CUST'"]]' -p $VOT 2>$tpm_stderr)
ERR=$(cat $tpm_stderr)
VALUE="$($GLOBALPATH/bin/cleos.sh get table daccustodian daccustodian votes -l 100000 | /bin/grep $VOT)"

COUNT=0
if [[ $ERR != *"executed transaction"* ]]; then
    COUNT=$((COUNT + 1))
    failed "$ERR"
    rm $tpm_stderr;
    break;
elif [[ $VALUE != *"$VOT"* ]]; then
    COUNT=$((COUNT + 1))
    failed "Account not added to the table"
    rm $tpm_stderr;
    break;
#else
    #echo "1:$TEST_NAME"
fi
done
done

if [[ $COUNT -eq 0 ]]; then
    echo "1:$TEST_NAME"
fi
