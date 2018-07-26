TEST_NAME="Unregister producer A"

. ../runner.sh

NAME="$( jq -r '.test_account_name' "$config" )"
SIGNING_KEY="$( jq -r '.signing_key' "$config" )"
#----------------------

CMD=$( $GLOBALPATH/bin/cleos.sh system unregprod testaccounta -p testaccounta 2>$tpm_stderr)
ERR=$(cat $tpm_stderr)
  if [[ $ERR != *"executed transaction"* ]]; then
    failed "$ERR"
    rm $tpm_stderr;
    exit 1;
  fi

echo "1:$TEST_NAME"
