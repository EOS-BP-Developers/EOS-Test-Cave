#!/bin/bash
################################################################################
#
# EOS Cleos wrapper
#
# Created by http://CryptoLions.io
#
# Git Hub: https://github.com/CryptoLions
# Eos Network Monitor: http://eosnetworkmonitor.io/
#
###############################################################################

REALPATH=$( command -v realpath || command -v grealpath )
JQ=$(command -v jq)
if ! [ -x "$JQ" ]; then
  echo 'Error: jq is not installed.' >&2
  exit 1
fi

SCRIPTPATH=$(/usr/bin/dirname $( $REALPATH $0))""
config="$SCRIPTPATH/../config.json"
WALLETHOST="$( $JQ -r '.walletAddr' "$config" )"
NODEHOST="$( $JQ -r '.nodeos' "$config" )"
CLEOS="$( $JQ -r '.cleos_bin' "$config" )"

$CLEOS -u http://$NODEHOST --wallet-url http://$WALLETHOST "$@"
