#!/bin/bash

REALPATH=$( command -v realpath || command -v grealpath )
JQ=$(command -v jq)
if ! [ -x "$JQ" ]; then
  echo 'Error: jq is not installed.' >&2
  exit 1
fi
CLEOS=$(command -v cleos)
if ! [ -x "$CLEOS" ]; then
  echo 'Error: cleos is not installed.' >&2
  exit 1
fi

GLOBALPATH=$(/usr/bin/dirname $( $REALPATH $0 ))
config="$GLOBALPATH/../config.json"
DIR="$( $JQ -r '.wallet_data_dir' "$config" )"
KEOSDBINDIR="$( $JQ -r '.keosd_bin' "$config" )"
WALLET_ADDRESS="$( $JQ -r '.walletAddr' "$config" )"

/bin/echo "Starting Keosd";

if [ ! -d "$DIR" ]; then
	/bin/mkdir "$DIR"
fi

$KEOSDBINDIR --data-dir $DIR --config-dir $DIR --http-server-address $WALLET_ADDRESS > $DIR/stdout.txt 2> $DIR/stderr.txt &  /bin/echo $! > $DIR/keosd.pid
