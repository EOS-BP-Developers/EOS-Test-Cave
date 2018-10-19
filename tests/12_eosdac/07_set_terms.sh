TEST_NAME="Set terms"

. ../runner.sh

KEY="$( jq -r '.eosio_pub_key' "$config" )"

#----------------------

CMD=$( $GLOBALPATH/bin/cleos.sh push action eosdactokens newmemterms '["https://raw.githubusercontent.com/eosdac/constitution/14d8d6d0262707f7c72183cff505d19e321f1cb3/constitution.md", "6d2cc6201302b3f485e2a939881ae451"]' -p eosdactokens 2>$tpm_stderr)

ERR=$(cat $tpm_stderr)

VALUE="$($GLOBALPATH/bin/cleos.sh get table eosdactokens eosdactokens memberterms | /bin/grep 6d2cc6201302b3f485e2a939881ae451)"

if [[ $ERR != *"executed transaction"* ]]; then
    failed "$ERR"
    rm $tpm_stderr;
elif [[ $VALUE != *"6d2cc6201302b3f485e2a939881ae451"* ]]; then
    failed "Values were not added to the table"
    rm $tpm_stderr;
else
    echo "1:$TEST_NAME"
fi
