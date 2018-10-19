TEST_NAME="Nominate candidates"

. ../runner.sh

KEY="$( jq -r '.eosio_pub_key' "$config" )"

#----------------------

for x in {a..z}
do
CUST="eosdaccusta$x"
CMD_0=$($GLOBALPATH/bin/cleos.sh transfer -c eosdactokens $CUST daccustodian "10000.0000 EOSDAC" "daccustodian" -p $CUST 2>$tpm_stderr)

CMD=$( $GLOBALPATH/bin/cleos.sh push action daccustodian nominatecand '["'$CUST'", "10.0000 EOS"]' -p $CUST 2>$tpm_stderr)

ERR=$(cat $tpm_stderr)

VALUE="$($GLOBALPATH/bin/cleos.sh get table daccustodian daccustodian candidates -L $CUST -l 1 | /bin/grep $CUST)"

if [[ $ERR != *"executed transaction"* ]]; then
    failed "$ERR"
    rm $tpm_stderr;
elif [[ $VALUE != *"$CUST"* ]]; then
    failed "Account not added to the table"
    rm $tpm_stderr;
else
    echo "1:$TEST_NAME"
fi
done

