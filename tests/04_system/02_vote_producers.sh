TEST_NAME="Vote producers"

. ../runner.sh

NAME="$( jq -r '.abp_account_name' "$config" )"

#----------------------

CMD=$( sleep 1 && $GLOBALPATH/bin/cleos.sh system voteproducer prods $NAME testaccounta testaccountb testaccountc testaccountd testaccounte testaccountf testaccountg testaccounth testaccounti testaccountj testaccountk testaccountl testaccountm testaccountn testaccounto testaccountp testaccountq testaccountr testaccounts testaccountt testaccountu 2>$tpm_stderr)
ERR=$(cat $tpm_stderr)
if [[ $ERR != *"executed transaction"* ]]; then
    failed "$ERR"
    rm $tpm_stderr;
else
    echo "1:$TEST_NAME"
fi
