# CMake generated Testfile for 
# Source directory: /home/eos/validation/eos_src/contracts/dice
# Build directory: /home/eos/validation/eos_src/build/contracts/dice
# 
# This file includes the relevant testing commands required for 
# testing this directory and lists subdirectories to be tested as well.
add_test(validate_dice_abi "/home/eos/validation/eos_src/build/scripts/abi_is_json.py" "/home/eos/validation/eos_src/contracts/dice/dice.abi")