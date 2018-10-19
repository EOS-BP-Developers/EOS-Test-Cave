#!/bin/bash

GLOBALPATH=$(pwd)

/bin/echo "Preparing and clearing..."

config="$GLOBALPATH/config.json"

if [ ! -f $config ]; then
    echo "config.json not found!"
    exit 1
fi

JQ=$(command -v jq)
if ! [ -x "$JQ" ]; then
  echo 'Error: jq is not installed.' >&2
  exit 1
fi

if ! [ -x "$(command -v bc)" ]; then
  echo 'Error: bc is not installed.' >&2
  exit 1
fi

NODE_DIR="$( $JQ -r '.node_data_dir' "$config" )"
WALLET_DIR="$( $JQ -r '.wallet_data_dir' "$config" )"

if [[ -z "$NODE_DIR" || -z "$WALLET_DIR" ]]; then
    echo "Invalid directory locations for nodeos and wallet"
    exit 1
fi

# Remove default wallets files in ~/eosio-wallet folder (to clean test)
/bin/rm -r $WALLET_DIR/*

# Remove logs from last testing
/bin/rm -r $GLOBALPATH/log/*.dat
/bin/rm -r $GLOBALPATH/log/*.log

# Restart the wallet
$GLOBALPATH/wallet/start.sh

# Restart chain
$GLOBALPATH/node/start.sh --delete-all-blocks --genesis-json $GLOBALPATH/node/genesis.json --verbose-http-errors
$GLOBALPATH/producing-nodes/start.sh --delete-all-blocks --genesis-json $GLOBALPATH/producing-nodes/genesis.json

print_test_result() {
    T_=$1
    T1=$(echo $T_ | /usr/bin/cut -d ":" -f 1)
    T2=$(echo $T_ | /usr/bin/cut -d ":" -f 2)
    if [[ $T1 -eq 1 ]]; then
    #echo -e "$T2 - \e[32m[OK]\e[39m" | column -t -s-

    /usr/bin/printf '\033[1;39m%-75s\033[m \033[1;32m%-25s\033[m\n' " $T2" "[OK]"
    TEST_OK_WALLET=$(($TEST_OK_WALLET+1))
    TEST_OK=$(($TEST_OK+1))
    else
    #echo -e "$T2 \t \033[31m[FAILED]\e[39m"
    /usr/bin/printf '\033[1;39m%-75s\033[m \033[1;31m%-25s\033[m\n' " $T2" "[FAILED]"
    TEST_FAILED_WALLET=$(($TEST_FAILED_WALLET+1))
    TEST_FAILED=$(($TEST_FAILED+1))
    fi

}

startCategoryTest(){
    DIR=$1;

    /bin/echo "";
    echo -e "\033[1;39m╔════════════════════╣ \033[1;32m Tests $1 \033[m ╠═══════════════════════════════╗\033[m \n";

    mydir=$(/bin/pwd)
    STARTTIME_GROUP=$(/bin/date +%s.%N)
    TEST_FAILED_WALLET=0
    TEST_OK_WALLET=0

    cd $1
    for f in *.sh; do
    print_test_result "$(./$f)"
    done
    cd $mydir

    ENDTIME_GROUP=$(/bin/date +%s.%N)
    DIFF_GROUP=$(/bin/echo "$ENDTIME_GROUP - $STARTTIME_GROUP" | /usr/bin/bc)

    echo ""
    echo -e "\033[1;39m┣━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━┫\033[m"
    echo " Tests: $1"
    echo " Time: $DIFF_GROUP sec"
    echo -e " Group Total \033[32mOK\033[39m/\033[31mFailed\033[39m/\033[1;39mTotal\033[m tests: \033[32m$TEST_OK_WALLET\033[m/\033[31m$TEST_FAILED_WALLET\033[m/\033[1;39m"$((TEST_OK_WALLET+TEST_FAILED_WALLET))"\033[m"

    echo -e "\033[1;39m╚══════════════════════════════════════════════════════════════════════════════╝\033[m \n";
}


#========================================================================================================================================

/bin/echo "START TESTING..."
TEST_FAILED=0
TEST_OK=0

STARTTIME=$(/bin/date +%s.%N)

#########################################################################################################################
#########################################################################################################################
startCategoryTest "tests/01_wallet"
startCategoryTest "tests/02_contracts"
startCategoryTest "tests/03_account"
startCategoryTest "tests/04_system"
startCategoryTest "tests/05_transfers"
startCategoryTest "tests/06_proxy_and_vote"
startCategoryTest "tests/07_name_bids"
startCategoryTest "tests/08_permissions"
#startCategoryTest "tests/09_msig"
startCategoryTest "tests/12_eosdac"

#if [ "$1" != "ci" ]; then
#    startCategoryTest "tests/09_msig"
#    startCategoryTest "tests/11_get_requests"
#    sleep 126;
#    startCategoryTest "tests/10_claimrewards"
#fi

#########################################################################################################################
#########################################################################################################################


ENDTIME=$(/bin/date +%s.%N)
DIFF=$(/bin/echo "$ENDTIME - $STARTTIME" | /usr/bin/bc)

/bin/echo ""
/bin/echo ""
/bin/echo -e "\e[92m━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━\e[m"
/bin/echo -e "\e[92m▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒\e[m"
/bin/echo -e "\e[92m▒\e[m"
/bin/echo -e "\e[92m▒\e[m  Time: $DIFF sec"
/bin/echo -e "\e[92m▒\e[m  Total \e[32mOK\e[39m/\e[31mFailed\e[39m/\e[1;39mTotal\e[m for all tests: \e[32m$TEST_OK\e[m/\e[31m$TEST_FAILED\e[m/\e[1;39m"$((TEST_OK+TEST_FAILED))"\e[m"
/bin/echo -e "\e[92m▒\e[m"
/bin/echo -e "\e[92m▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒\e[m"
/bin/echo ""

[ $TEST_FAILED -eq 0 ] && exit 0 || cat $GLOBALPATH/log/log_error.log && exit 1
