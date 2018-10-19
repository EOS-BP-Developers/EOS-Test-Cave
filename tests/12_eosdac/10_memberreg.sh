TEST_NAME="Member reg"

. ../runner.sh

KEY="$( jq -r '.eosio_pub_key' "$config" )"

#----------------------

CONSTITUTION=$($GLOBALPATH/bin/cleos.sh get table eosdactokens eosdactokens memberterms | jq '.rows[0].terms' | tr -d '"')
wget -O constitution.md $CONSTITUTION
CON_MD5=$(md5sum constitution.md | cut -d' ' -f1)
rm -f constitution.md

for x in {a..z}
do
CUST="eosdaccusta$x"
CMD=$( $GLOBALPATH/bin/cleos.sh push action eosdactokens memberreg '["'$CUST'", "'$CON_MD5'"]' -p $CUST 2>$tpm_stderr)

ERR=$(cat $tpm_stderr)

VALUE="$($GLOBALPATH/bin/cleos.sh get table eosdactokens eosdactokens members -l 100000 | /bin/grep $CUST)"

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
