#pragma once
#include <eosio/testing/tester.hpp>

namespace eosio { namespace testing {

struct contracts {
   static std::vector<uint8_t> system_wasm() { return read_wasm("/home/ubuntu/eosio.contracts/build/tests/../eosio.system/eosio.system.wasm"); }
   static std::string          system_wast() { return read_wast("/home/ubuntu/eosio.contracts/build/tests/../eosio.system/eosio.system.wast"); }
   static std::vector<char>    system_abi() { return read_abi("/home/ubuntu/eosio.contracts/build/tests/../eosio.system/eosio.system.abi"); }
   static std::vector<uint8_t> token_wasm() { return read_wasm("/home/ubuntu/eosio.contracts/build/tests/../eosio.token/eosio.token.wasm"); }
   static std::string          token_wast() { return read_wast("/home/ubuntu/eosio.contracts/build/tests/../eosio.token/eosio.token.wast"); }
   static std::vector<char>    token_abi() { return read_abi("/home/ubuntu/eosio.contracts/build/tests/../eosio.token/eosio.token.abi"); } 
   static std::vector<uint8_t> msig_wasm() { return read_wasm("/home/ubuntu/eosio.contracts/build/tests/../eosio.msig/eosio.msig.wasm"); }
   static std::string          msig_wast() { return read_wast("/home/ubuntu/eosio.contracts/build/tests/../eosio.msig/eosio.msig.wast"); }
   static std::vector<char>    msig_abi() { return read_abi("/home/ubuntu/eosio.contracts/build/tests/../eosio.msig/eosio.msig.abi"); }
   static std::vector<uint8_t> sudo_wasm() { return read_wasm("/home/ubuntu/eosio.contracts/build/tests/../eosio.sudo/eosio.sudo.wasm"); }
   static std::string          sudo_wast() { return read_wast("/home/ubuntu/eosio.contracts/build/tests/../eosio.sudo/eosio.sudo.wast"); }
   static std::vector<char>    sudo_abi() { return read_abi("/home/ubuntu/eosio.contracts/build/tests/../eosio.sudo/eosio.sudo.abi"); }
   
   struct util {
      static std::vector<uint8_t> test_api_wasm() { return read_wasm("/home/ubuntu/eosio.contracts/tests/test_contracts/test_api.wasm"); }
      static std::vector<uint8_t> exchange_wasm() { return read_wasm("/home/ubuntu/eosio.contracts/tests/test_contracts/exchange.wasm"); }
   };
};
}} //ns eosio::testing
