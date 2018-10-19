
TEST_NAME="Execute msig proposal"

. ../runner.sh

# multisig propose [OPTIONS] proposal_name requested_permissions trx_permissions contract action data [proposer] [proposal_expiration]

msig_json="$GLOBALPATH/log/tmp_msig.json"
#----------------------
NAME="firecust"
proposer="eosdaccustak"

CMD=$( $GLOBALPATH/bin/cleos.sh multisig exec $proposer $NAME -p $proposer@active 2>$tpm_stderr )
ERR=$(cat $tpm_stderr)
CMD2=$( $GLOBALPATH/bin/cleos.sh get table daccustodian daccustodian candidates -l 10000 | /bin/grep eosdaccustal -A2 | /bin/grep is_active >$tpm_stderr_2)
VAL=$(cat $tpm_stderr_2)
if [[ $ERR != *"executed transaction"* ]]; then
    failed $ERR
    rm $tpm_stderr;
    exit 1;
elif [[ $VAL != *"0"* ]]; then
    failed "Candidate is not inactive"
    rm $tpm_stderr;
    rm $tpm_stderr_2;
    exit 1;
fi

echo "1:$TEST_NAME"
