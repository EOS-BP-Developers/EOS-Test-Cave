TEST_NAME="Change votes and schedule"

. ../runner.sh

NAME="$( jq -r '.abp_account_name' "$config" )"

#----------------------

CMD=$( $GLOBALPATH/bin/cleos.sh system voteproducer prods $NAME testaccountb testaccountc testaccountd testaccounte testaccountf testaccountg testaccounth testaccounti testaccountj testaccountk testaccountl testaccountm testaccountn testaccounto testaccountp testaccountq testaccountr testaccounts testaccountt testaccountu testaccountv 2>$tpm_stderr)
ERR=$(cat $tpm_stderr)
if [[ $ERR != *"executed transaction"* ]]; then
    failed "$ERR"
    rm $tpm_stderr;
else
    echo "1:$TEST_NAME" && sleep 2
fi
