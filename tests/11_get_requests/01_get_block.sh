TEST_NAME="Get block"

. ../runner.sh

#----------------------
CMD=$( sleep 1 && $GLOBALPATH/bin/cleos.sh get block 10 2>$tpm_stderr)

ERR=$(cat $tpm_stderr)

if [[ $ERR != "" ]]; then
    failed "$ERR"
    rm $tpm_stderr;
else
    echo "1:$TEST_NAME"
fi
