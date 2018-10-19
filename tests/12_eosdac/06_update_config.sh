TEST_NAME="Update dac config"

. ../runner.sh

KEY="$( jq -r '.eosio_pub_key' "$config" )"

#----------------------

CMD=$( $GLOBALPATH/bin/cleos.sh push action daccustodian updateconfig '["10000.0000 EOSDAC", 5, 12, 6, "dacauthority", "eosdacthedac", 15, 3, 11, 9, 7, 1, "50.0000 EOS"]' -p daccustodian 2>$tpm_stderr)

ERR=$(cat $tpm_stderr)

VALUE="$($GLOBALPATH/bin/cleos.sh get table daccustodian daccustodian config | /bin/grep dacauthority)"

if [[ $ERR != *"executed transaction"* ]]; then
    failed "$ERR"
    rm $tpm_stderr;
elif [[ $VALUE != *"dacauthority"* ]]; then
    failed "Values were not added to the table"
    rm $tpm_stderr;
else
    echo "1:$TEST_NAME"
fi
