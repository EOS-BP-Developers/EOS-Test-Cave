TEST_NAME="Not a test change permissions"

. ../runner.sh

KEY="$( jq -r '.eosio_pub_key' "$config" )"

#----------------------

CMD_0=$($GLOBALPATH/bin/cleos.sh set account permission eosdacserver active ./resign.json owner -p eosdacserver@owner 2>$tpm_stderr)

CMD_1=$($GLOBALPATH/bin/cleos.sh set account permission eosdacserver owner ./resign.json '' -p eosdacserver@owner 2>$tpm_stderr)

CMD_2=$($GLOBALPATH/bin/cleos.sh set account permission eosdactokens active ./resign.json owner -p eosdacstokens@owner 2>$tpm_stderr)

CMD_3=$($GLOBALPATH/bin/cleos.sh set account permission eosdactokens owner ./resign.json '' -p eosdacstokens@owner 2>$tpm_stderr)

CMD_10=$($GLOBALPATH/bin/cleos.sh set account permission daccustodian xfer ./daccustodian_transfer.json active -p daccustodian@owner 2>$tpm_stderr)

CMD1=$($GLOBALPATH/bin/cleos.sh set action permission daccustodian eosdactokens transfer xfer -p daccustodian@owner 2>$tpm_stderr)

#CMD_11=$($GLOBALPATH/bin/cleos.sh set action permission daccustodian eosio.token transfer xfer -p daccustodian@owner 2>$tpm_stderr)

CMD_4=$($GLOBALPATH/bin/cleos.sh set account permission daccustodian active ./resign.json owner -p daccustodian@owner 2>$tpm_stderr)

CMD_5=$($GLOBALPATH/bin/cleos.sh set account permission daccustodian owner ./resign.json '' -p daccustodian@owner 2>$tpm_stderr)

CMD_8=$($GLOBALPATH/bin/cleos.sh set account permission eosdacthedac xfer ./daccustodian_transfer.json active -p eosdacthedac@owner 2>$tpm_stderr)

CMD_9=$($GLOBALPATH/bin/cleos.sh set action permission eosdacthedac eosio.token transfer xfer -p eosdacthedac@owner 2>$tpm_stderr)

CMD_6=$($GLOBALPATH/bin/cleos.sh set account permission eosdacthedac active ./resign.json owner -p eosdacthedac@owner 2>$tpm_stderr)

CMD_7=$($GLOBALPATH/bin/cleos.sh set account permission eosdacthedac owner ./resign.json '' -p eosdacthedac@owner 2>$tpm_stderr)

CMD=$( $GLOBALPATH/bin/cleos.sh set account permission dacauthority owner ./daccustodian_update_auth.json '' -p dacauthority@owner 2>$tpm_stderr)

#CMD_12=$($GLOBALPATH/bin/cleos.sh set action permission dacauthority eosio updateauth owner -p dacauthority@owner 2>$tpm_stderr)

ERR=$(cat $tpm_stderr)

if [[ $ERR != *"executed transaction"* ]]; then
    failed "$ERR"
    rm $tpm_stderr;
else
    echo "1:$TEST_NAME"
fi
