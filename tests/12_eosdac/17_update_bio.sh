TEST_NAME="Update bio"

. ../runner.sh

KEY="$( jq -r '.eosio_pub_key' "$config" )"

#----------------------

CMD=$( $GLOBALPATH/bin/cleos.sh push action daccustodian updatebio '["eosdaccustab", "My name is eosdaccustab. I would love to be a part of the DAC and contribute wherever possible."]' -p eosdaccustab 2>$tpm_stderr)

ERR=$(cat $tpm_stderr)

if [[ $ERR != *"executed transaction"* ]]; then
    failed "$ERR"
    rm $tpm_stderr;
else
    echo "1:$TEST_NAME"
fi
