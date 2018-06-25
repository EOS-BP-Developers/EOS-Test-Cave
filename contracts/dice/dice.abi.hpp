const char* const dice_abi = R"=====(
{
   "version": "eosio::abi/1.0",
  "types": [{
      "new_type_name": "account_name",
      "type": "name"
  }],
  "structs": [{
      "name": "offer",
      "base": "",
      "fields": [{
          "name": "id",
          "type": "uint64"
        },{
          "name": "owner",
          "type": "account_name"
        },{
          "name": "bet",
          "type": "asset"
        },{
          "name": "commitment",
          "type": "checksum256"
        },{
          "name": "gameid",
          "type": "uint64"
        }
      ]
    },{
      "name": "player",
      "base": "",
      "fields": [{
          "name": "commitment",
          "type": "checksum256"
        },{
          "name": "reveal",
          "type": "checksum256"
        }
      ]
    },{
      "name": "game",
      "base": "",
      "fields": [{
          "name": "id",
          "type": "uint64"
        },{
          "name": "bet",
          "type": "asset"
        },{
          "name": "deadline",
          "type": "time_point_sec"
        },{
          "name": "player1",
          "type": "player"
        },{
          "name": "player2",
          "type": "player"
        }
      ]
    },{
      "name": "global_dice",
      "base": "",
      "fields": [{
          "name": "id",
          "type": "uint64"
        },{
          "name": "nextgameid",
          "type": "uint64"
        }
      ]
    },{
      "name": "account",
      "base": "",
      "fields": [{
          "name": "owner",
          "type": "account_name"
        },{
          "name": "eos_balance",
          "type": "asset"
        },{
          "name": "open_offers",
          "type": "uint32"
        },{
          "name": "open_games",
          "type": "uint32"
        }
      ]
    },{
      "name": "offerbet",
      "base": "",
      "fields": [{
          "name": "bet",
          "type": "asset"
        },{
          "name": "player",
          "type": "account_name"
        },{
          "name": "commitment",
          "type": "checksum256"
        }
      ]
    },{
      "name": "canceloffer",
      "base": "",
      "fields": [{
          "name": "commitment",
          "type": "checksum256"
        }
      ]
    },{
      "name": "reveal",
      "base": "",
      "fields": [{
          "name": "commitment",
          "type": "checksum256"
        },{
          "name": "source",
          "type": "checksum256"
        }
      ]
    },{
      "name": "claimexpired",
      "base": "",
      "fields": [{
          "name": "gameid",
          "type": "uint64"
        }
      ]
    },{
      "name": "deposit",
      "base": "",
      "fields": [{
          "name": "from",
          "type": "account_name"
        },{
          "name": "a",
          "type": "asset"
        }
      ]
    },{
      "name": "withdraw",
      "base": "",
      "fields": [{
          "name": "to",
          "type": "account_name"
        },{
          "name": "a",
          "type": "asset"
        }
      ]
    }
  ],
  "actions": [{
      "name": "offerbet",
      "type": "offerbet",
      "ricardian_contract": ""
    },{
      "name": "canceloffer",
      "type": "canceloffer",
      "ricardian_contract": ""
    },{
      "name": "reveal",
      "type": "reveal",
      "ricardian_contract": ""
    },{
      "name": "claimexpired",
      "type": "claimexpired",
      "ricardian_contract": ""
    },{
      "name": "deposit",
      "type": "deposit",
      "ricardian_contract": ""
    },{
      "name": "withdraw",
      "type": "withdraw",
      "ricardian_contract": ""
    }
  ],
  "tables": [{
      "name": "offer",
      "index_type": "i64",
      "key_names": [
        "id"
      ],
      "key_types": [
        "uint64"
      ],
      "type": "offer"
    },{
      "name": "game",
      "index_type": "i64",
      "key_names": [
        "id"
      ],
      "key_types": [
        "uint64"
      ],
      "type": "game"
    },{
      "name": "global",
      "index_type": "i64",
      "key_names": [
        "id"
      ],
      "key_types": [
        "uint64"
      ],
      "type": "global_dice"
    },{
      "name": "account",
      "index_type": "i64",
      "key_names": [
        "owner"
      ],
      "key_types": [
        "account_name"
      ],
      "type": "account"
    }
  ],
  "ricardian_clauses": [],
  "abi_extensions": []
}
)=====";
