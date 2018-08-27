#!/bin/bash
#######################################################
##                                                   ##
## Script Created by CryptoLions, HKEOS and EOS Rio  ##
## For EOS Ghostbusters Testnet                      ##
##                                                   ##
## https://github.com/CryptoLions                    ##
## https://github.com/eosrio                         ##
## https://github.com/HKEOS/Ghostbusters-Testnet     ##
##                                                   ##
#######################################################

REALPATH=$( command -v realpath || command -v grealpath )
JQ=$(command -v jq)
if ! [ -x "$JQ" ]; then
  echo 'Error: jq is not installed.' >&2
  exit 1
fi

GLOBALPATH=$(/usr/bin/dirname $($REALPATH $0))
config="$GLOBALPATH/../config.json"

DATADIR="$( $JQ -r '.node_data_dir_2' "$config" )"
NODEOS="$( $JQ -r '.node_bin' "$config" )"

/bin/echo "Starting Nodeos";

if [ ! -d "$DATADIR" ]; then
	/bin/mkdir "$DATADIR"
fi

$GLOBALPATH/stop.sh
$NODEOS --data-dir $DATADIR --config-dir $DATADIR "$@" > $DATADIR/stdout.txt 2> $DATADIR/stderr.txt & /bin/echo $! > $DATADIR/nodeos.pid
