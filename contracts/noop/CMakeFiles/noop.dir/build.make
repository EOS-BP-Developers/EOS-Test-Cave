# CMAKE generated file: DO NOT EDIT!
# Generated by "Unix Makefiles" Generator, CMake Version 3.10

# Delete rule output on recipe failure.
.DELETE_ON_ERROR:


#=============================================================================
# Special targets provided by cmake.

# Disable implicit rules so canonical targets will work.
.SUFFIXES:


# Remove some rules from gmake that .SUFFIXES does not remove.
SUFFIXES =

.SUFFIXES: .hpux_make_needs_suffix_list


# Suppress display of executed commands.
$(VERBOSE).SILENT:


# A target that is always out of date.
cmake_force:

.PHONY : cmake_force

#=============================================================================
# Set environment variables for the build.

# The shell in which to execute make rules.
SHELL = /bin/sh

# The CMake executable.
CMAKE_COMMAND = /usr/bin/cmake

# The command to remove a file.
RM = /usr/bin/cmake -E remove -f

# Escaping for special characters.
EQUALS = =

# The top-level source directory on which CMake was run.
CMAKE_SOURCE_DIR = /home/ubuntu/eos

# The top-level build directory on which CMake was run.
CMAKE_BINARY_DIR = /home/ubuntu/eos/build

# Utility rule file for noop.

# Include the progress variables for this target.
include contracts/noop/CMakeFiles/noop.dir/progress.make

contracts/noop/CMakeFiles/noop: contracts/noop/noop.wast.hpp
contracts/noop/CMakeFiles/noop: contracts/noop/noop.abi.hpp
contracts/noop/CMakeFiles/noop: contracts/noop/noop.wasm


contracts/noop/noop.wast.hpp: contracts/noop/noop.wast
	@$(CMAKE_COMMAND) -E cmake_echo_color --switch=$(COLOR) --blue --bold --progress-dir=/home/ubuntu/eos/build/CMakeFiles --progress-num=$(CMAKE_PROGRESS_1) "Generating noop.wast.hpp"
	cd /home/ubuntu/eos/build/contracts/noop && echo "const char* const noop_wast = R\"=====(" > /home/ubuntu/eos/build/contracts/noop/noop.wast.hpp
	cd /home/ubuntu/eos/build/contracts/noop && cat /home/ubuntu/eos/build/contracts/noop/noop.wast >> /home/ubuntu/eos/build/contracts/noop/noop.wast.hpp
	cd /home/ubuntu/eos/build/contracts/noop && echo ")=====\";" >> /home/ubuntu/eos/build/contracts/noop/noop.wast.hpp

contracts/noop/noop.abi.hpp: contracts/noop/noop.abi
	@$(CMAKE_COMMAND) -E cmake_echo_color --switch=$(COLOR) --blue --bold --progress-dir=/home/ubuntu/eos/build/CMakeFiles --progress-num=$(CMAKE_PROGRESS_2) "Generating noop.abi.hpp"
	cd /home/ubuntu/eos/build/contracts/noop && echo "const char* const noop_abi = R\"=====(" > /home/ubuntu/eos/build/contracts/noop/noop.abi.hpp
	cd /home/ubuntu/eos/build/contracts/noop && cat /home/ubuntu/eos/build/contracts/noop/noop.abi >> /home/ubuntu/eos/build/contracts/noop/noop.abi.hpp
	cd /home/ubuntu/eos/build/contracts/noop && echo ")=====\";" >> /home/ubuntu/eos/build/contracts/noop/noop.abi.hpp

contracts/noop/noop.wasm: contracts/noop/noop.wast.hpp
	@$(CMAKE_COMMAND) -E cmake_echo_color --switch=$(COLOR) --blue --bold --progress-dir=/home/ubuntu/eos/build/CMakeFiles --progress-num=$(CMAKE_PROGRESS_3) "Generating WASM noop.wasm"
	cd /home/ubuntu/eos/build/contracts/noop && /home/ubuntu/eos/build/libraries/wasm-jit/Source/Programs/eosio-wast2wasm /home/ubuntu/eos/build/contracts/noop/noop.wast /home/ubuntu/eos/build/contracts/noop/noop.wasm -n

contracts/noop/noop.wast: contracts/noop/noop.s
	@$(CMAKE_COMMAND) -E cmake_echo_color --switch=$(COLOR) --blue --bold --progress-dir=/home/ubuntu/eos/build/CMakeFiles --progress-num=$(CMAKE_PROGRESS_4) "Generating WAST noop.wast"
	cd /home/ubuntu/eos/build/contracts/noop && /home/ubuntu/eos/build/externals/binaryen/bin/eosio-s2wasm -o /home/ubuntu/eos/build/contracts/noop/noop.wast -s 10240 noop.s

contracts/noop/noop.s: contracts/noop/noop.bc
	@$(CMAKE_COMMAND) -E cmake_echo_color --switch=$(COLOR) --blue --bold --progress-dir=/home/ubuntu/eos/build/CMakeFiles --progress-num=$(CMAKE_PROGRESS_5) "Generating textual assembly noop.s"
	cd /home/ubuntu/eos/build/contracts/noop && /home/ubuntu/opt/wasm/bin/llc -thread-model=single -asm-verbose=false -o noop.s noop.bc

contracts/noop/noop.bc: contracts/noop/noop.cpp.bc
contracts/noop/noop.bc: contracts/libc++/libc++.bc
contracts/noop/noop.bc: contracts/musl/libc.bc
contracts/noop/noop.bc: contracts/eosiolib/eosiolib.bc
	@$(CMAKE_COMMAND) -E cmake_echo_color --switch=$(COLOR) --blue --bold --progress-dir=/home/ubuntu/eos/build/CMakeFiles --progress-num=$(CMAKE_PROGRESS_6) "Linking LLVM bitcode executable noop.bc"
	cd /home/ubuntu/eos/build/contracts/noop && /home/ubuntu/opt/wasm/bin/llvm-link -only-needed -o noop.bc noop.cpp.bc /home/ubuntu/eos/build/contracts/libc++/libc++.bc /home/ubuntu/eos/build/contracts/musl/libc.bc /home/ubuntu/eos/build/contracts/eosiolib/eosiolib.bc

contracts/noop/noop.cpp.bc: ../contracts/noop/noop.cpp
contracts/noop/noop.cpp.bc: ../contracts/noop/noop.cpp
	@$(CMAKE_COMMAND) -E cmake_echo_color --switch=$(COLOR) --blue --bold --progress-dir=/home/ubuntu/eos/build/CMakeFiles --progress-num=$(CMAKE_PROGRESS_7) "Building LLVM bitcode noop.cpp.bc"
	cd /home/ubuntu/eos/build/contracts/noop && /home/ubuntu/opt/wasm/bin/clang -emit-llvm -O3 --std=c++14 --target=wasm32 -ffreestanding -nostdlib -nostdlibinc -DBOOST_DISABLE_ASSERTS -DBOOST_EXCEPTION_DISABLE -fno-threadsafe-statics -fno-rtti -fno-exceptions -c /home/ubuntu/eos/contracts/noop/noop.cpp -o noop.cpp.bc -Weverything -Wno-c++98-compat -Wno-old-style-cast -Wno-vla -Wno-vla-extension -Wno-c++98-compat-pedantic -Wno-missing-prototypes -Wno-missing-variable-declarations -Wno-packed -Wno-padded -Wno-c99-extensions -Wno-documentation-unknown-command -I /home/ubuntu/eos/contracts -I /home/ubuntu/eos/externals/magic_get/include -isystem /home/ubuntu/eos/contracts/libc++/upstream/include -isystem /home/ubuntu/eos/contracts/musl/upstream/include -isystem /home/ubuntu/opt/boost/include -isystem /home/ubuntu/eos/contracts/libc++/upstream/include -isystem /home/ubuntu/eos/contracts/musl/upstream/include -isystem /home/ubuntu/opt/boost/include

noop: contracts/noop/CMakeFiles/noop
noop: contracts/noop/noop.wast.hpp
noop: contracts/noop/noop.abi.hpp
noop: contracts/noop/noop.wasm
noop: contracts/noop/noop.wast
noop: contracts/noop/noop.s
noop: contracts/noop/noop.bc
noop: contracts/noop/noop.cpp.bc
noop: contracts/noop/CMakeFiles/noop.dir/build.make

.PHONY : noop

# Rule to build all files generated by this target.
contracts/noop/CMakeFiles/noop.dir/build: noop

.PHONY : contracts/noop/CMakeFiles/noop.dir/build

contracts/noop/CMakeFiles/noop.dir/clean:
	cd /home/ubuntu/eos/build/contracts/noop && $(CMAKE_COMMAND) -P CMakeFiles/noop.dir/cmake_clean.cmake
.PHONY : contracts/noop/CMakeFiles/noop.dir/clean

contracts/noop/CMakeFiles/noop.dir/depend:
	cd /home/ubuntu/eos/build && $(CMAKE_COMMAND) -E cmake_depends "Unix Makefiles" /home/ubuntu/eos /home/ubuntu/eos/contracts/noop /home/ubuntu/eos/build /home/ubuntu/eos/build/contracts/noop /home/ubuntu/eos/build/contracts/noop/CMakeFiles/noop.dir/DependInfo.cmake --color=$(COLOR)
.PHONY : contracts/noop/CMakeFiles/noop.dir/depend

