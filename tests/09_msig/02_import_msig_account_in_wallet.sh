TEST_NAME="Import msig account private key in wallet"

. ../runner.sh

accounts=( testmultisig msigconfirm1 msigconfirm2 msigconfirm3 );

#----------------------
PUB_KEY=$( cat $GLOBALPATH/log/wallet_name_testwallet_key.dat | cut -d' ' -f1)
PRIV_KEY=$( cat $GLOBALPATH/log/wallet_name_testwallet_key.dat | cut -d' ' -f2)

for NAME in "${accounts[@]}"; do
  # Check Wallet
  CMD=$( $GLOBALPATH/bin/cleos.sh wallet create -n $NAME 2> $tpm_stderr )
  ERR=$(cat $tpm_stderr)
  if [[ $ERR != "" ]]; then
      failed "$ERR"
      rm $tpm_stderr;
      exit 1
  else
      WALLET_PASS=$(echo $CMD | awk -F\" '{ print $2 }')
      echo $WALLET_PASS > "$GLOBALPATH/log/wallet_name_"$NAME"_password.dat"
  fi

  CMD=$( $GLOBALPATH/bin/cleos.sh wallet import -n $NAME --private-key $PRIV_KEY 2> $tpm_stderr )
  ERR=$(cat $tpm_stderr)
  CHK_KEY=$(echo $CMD | awk '{print $5}')
  if [[ $ERR != "" ]]; then
      failed "$ERR"
      rm $tpm_stderr;
      exit 1
  elif [[ $CHK_KEY != $PUB_KEY ]]; then
      failed "$ERR"
      echo "$CHK_KEY / $PUB_KEY"
      rm $tpm_stderr;
      exit 1
  fi
done
echo "1:$TEST_NAME" && sleep 2
