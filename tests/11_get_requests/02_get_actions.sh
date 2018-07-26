TEST_NAME="Get actions"

. ../runner.sh

NAME="$( jq -r '.abp_account_name' "$config" )"
#----------------------
CMD=$( $GLOBALPATH/bin/cleos.sh get actions $NAME 2>$tpm_stderr)

ERR=$(cat $tpm_stderr)

if [[ $ERR != *"$NAME"* ]]; then
    failed "$ERR"
    rm $tpm_stderr;
else
    echo "1:$TEST_NAME"
fi
