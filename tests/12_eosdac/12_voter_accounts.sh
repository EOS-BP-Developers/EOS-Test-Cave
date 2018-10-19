TEST_NAME="Generate voter accounts"

. ../runner.sh

KEY="$( jq -r '.eosio_pub_key' "$config" )"

#----------------------

CONSTITUTION=$($GLOBALPATH/bin/cleos.sh get table eosdactokens eosdactokens memberterms | jq '.rows[0].terms' | tr -d '"')
wget -O constitution.md $CONSTITUTION
CON_MD5=$(md5sum constitution.md | cut -d' ' -f1)
rm -f constitution.md

for x in {a..z}
do
for y in {a..z}
do
VOT="eosdacvote$x$y"

CMD_0=$($GLOBALPATH/bin/cleos.sh system newaccount eosio $VOT $KEY --stake-net "1000.0000 EOS" --stake-cpu "1000.0000 EOS" --buy-ram-kbytes 1024 -p eosio 2>$tpm_stderr)

CMD_1=$($GLOBALPATH/bin/cleos.sh transfer -c eosdactokens eosdactokens $VOT "1000000.0000 EOSDAC" "vote tokens" -p eosdactokens 2>$tpm_stderr)

CMD=$( $GLOBALPATH/bin/cleos.sh push action eosdactokens memberreg '["'$VOT'", "'$CON_MD5'"]' -p $VOT 2>$tpm_stderr)

ERR=$(cat $tpm_stderr)

VALUE="$($GLOBALPATH/bin/cleos.sh get table eosdactokens eosdactokens members -l 1000000 | /bin/grep $VOT)"

COUNT=0
if [[ $ERR != *"executed transaction"* ]]; then
    COUNT=$((COUNT + 1))
    failed "$ERR"
    rm $tpm_stderr;
    break;
elif [[ $VALUE != *"$VOT"* ]]; then
    COUNT=$((COUNT + 1))
    failed "Account not added to the table"
    rm $tpm_stderr;
    break;
#else
    #echo "1:$TEST_NAME"
fi
done
done

if [[ $COUNT -eq 0 ]]; then
    echo "1:$TEST_NAME"
fi

