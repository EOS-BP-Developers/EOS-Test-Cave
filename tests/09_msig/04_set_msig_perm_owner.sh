TEST_NAME="Set Multisig Owner Permission"

. ../runner.sh

#----------------------
# Usage :  cleos set account permission [OPTIONS] account permission authority [parent]

# generate json for owner multisig
accounts=( testmultisig msigconfirm1 msigconfirm2 msigconfirm3 );
msig_json="$GLOBALPATH/log/tmp_msig.json"
NAME=${accounts[0]}

echo '{"threshold":2,"keys":[],"accounts":[' > $msig_json
for ((x=1;x<=3;x++)); do
  if [ $x -eq 3 ]; then
    echo '{"permission":{"actor":"'${accounts[$x]}'","permission":"owner"},"weight":1}' >> $msig_json
  else
    echo '{"permission":{"actor":"'${accounts[$x]}'","permission":"owner"},"weight":1},' >> $msig_json
  fi
done
echo '], "waits":[]}' >> $msig_json

CMD=$( $GLOBALPATH/bin/cleos.sh set account permission ${NAME} owner "$(cat $msig_json)" -p ${NAME}@owner 2>${tpm_stderr})

ERR=$(cat $tpm_stderr)
if [[ $ERR != *"executed transaction"* ]]; then
  failed "$ERR"
  rm $tpm_stderr;
  exit 1;
fi
echo "1:$TEST_NAME" && sleep 2
