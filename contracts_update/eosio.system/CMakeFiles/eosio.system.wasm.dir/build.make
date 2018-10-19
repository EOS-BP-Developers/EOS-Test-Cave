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
CMAKE_SOURCE_DIR = /home/ubuntu/eosio.contracts

# The top-level build directory on which CMake was run.
CMAKE_BINARY_DIR = /home/ubuntu/eosio.contracts/build

# Include any dependencies generated for this target.
include eosio.system/CMakeFiles/eosio.system.wasm.dir/depend.make

# Include the progress variables for this target.
include eosio.system/CMakeFiles/eosio.system.wasm.dir/progress.make

# Include the compile flags for this target's objects.
include eosio.system/CMakeFiles/eosio.system.wasm.dir/flags.make

eosio.system/CMakeFiles/eosio.system.wasm.dir/src/eosio.system.cpp.o: eosio.system/CMakeFiles/eosio.system.wasm.dir/flags.make
eosio.system/CMakeFiles/eosio.system.wasm.dir/src/eosio.system.cpp.o: ../eosio.system/src/eosio.system.cpp
	@$(CMAKE_COMMAND) -E cmake_echo_color --switch=$(COLOR) --green --progress-dir=/home/ubuntu/eosio.contracts/build/CMakeFiles --progress-num=$(CMAKE_PROGRESS_1) "Building CXX object eosio.system/CMakeFiles/eosio.system.wasm.dir/src/eosio.system.cpp.o"
	cd /home/ubuntu/eosio.contracts/build/eosio.system && /usr/local/eosio.wasmsdk//bin/eosio-cpp  $(CXX_DEFINES) $(CXX_INCLUDES) $(CXX_FLAGS) -o CMakeFiles/eosio.system.wasm.dir/src/eosio.system.cpp.o -c /home/ubuntu/eosio.contracts/eosio.system/src/eosio.system.cpp

eosio.system/CMakeFiles/eosio.system.wasm.dir/src/eosio.system.cpp.i: cmake_force
	@$(CMAKE_COMMAND) -E cmake_echo_color --switch=$(COLOR) --green "Preprocessing CXX source to CMakeFiles/eosio.system.wasm.dir/src/eosio.system.cpp.i"
	cd /home/ubuntu/eosio.contracts/build/eosio.system && /usr/local/eosio.wasmsdk//bin/eosio-cpp $(CXX_DEFINES) $(CXX_INCLUDES) $(CXX_FLAGS) -E /home/ubuntu/eosio.contracts/eosio.system/src/eosio.system.cpp > CMakeFiles/eosio.system.wasm.dir/src/eosio.system.cpp.i

eosio.system/CMakeFiles/eosio.system.wasm.dir/src/eosio.system.cpp.s: cmake_force
	@$(CMAKE_COMMAND) -E cmake_echo_color --switch=$(COLOR) --green "Compiling CXX source to assembly CMakeFiles/eosio.system.wasm.dir/src/eosio.system.cpp.s"
	cd /home/ubuntu/eosio.contracts/build/eosio.system && /usr/local/eosio.wasmsdk//bin/eosio-cpp $(CXX_DEFINES) $(CXX_INCLUDES) $(CXX_FLAGS) -S /home/ubuntu/eosio.contracts/eosio.system/src/eosio.system.cpp -o CMakeFiles/eosio.system.wasm.dir/src/eosio.system.cpp.s

eosio.system/CMakeFiles/eosio.system.wasm.dir/src/eosio.system.cpp.o.requires:

.PHONY : eosio.system/CMakeFiles/eosio.system.wasm.dir/src/eosio.system.cpp.o.requires

eosio.system/CMakeFiles/eosio.system.wasm.dir/src/eosio.system.cpp.o.provides: eosio.system/CMakeFiles/eosio.system.wasm.dir/src/eosio.system.cpp.o.requires
	$(MAKE) -f eosio.system/CMakeFiles/eosio.system.wasm.dir/build.make eosio.system/CMakeFiles/eosio.system.wasm.dir/src/eosio.system.cpp.o.provides.build
.PHONY : eosio.system/CMakeFiles/eosio.system.wasm.dir/src/eosio.system.cpp.o.provides

eosio.system/CMakeFiles/eosio.system.wasm.dir/src/eosio.system.cpp.o.provides.build: eosio.system/CMakeFiles/eosio.system.wasm.dir/src/eosio.system.cpp.o


# Object files for target eosio.system.wasm
eosio_system_wasm_OBJECTS = \
"CMakeFiles/eosio.system.wasm.dir/src/eosio.system.cpp.o"

# External object files for target eosio.system.wasm
eosio_system_wasm_EXTERNAL_OBJECTS =

eosio.system/eosio.system.wasm: eosio.system/CMakeFiles/eosio.system.wasm.dir/src/eosio.system.cpp.o
eosio.system/eosio.system.wasm: eosio.system/CMakeFiles/eosio.system.wasm.dir/build.make
eosio.system/eosio.system.wasm: eosio.system/CMakeFiles/eosio.system.wasm.dir/link.txt
	@$(CMAKE_COMMAND) -E cmake_echo_color --switch=$(COLOR) --green --bold --progress-dir=/home/ubuntu/eosio.contracts/build/CMakeFiles --progress-num=$(CMAKE_PROGRESS_2) "Linking CXX executable eosio.system.wasm"
	cd /home/ubuntu/eosio.contracts/build/eosio.system && $(CMAKE_COMMAND) -E cmake_link_script CMakeFiles/eosio.system.wasm.dir/link.txt --verbose=$(VERBOSE)

# Rule to build all files generated by this target.
eosio.system/CMakeFiles/eosio.system.wasm.dir/build: eosio.system/eosio.system.wasm

.PHONY : eosio.system/CMakeFiles/eosio.system.wasm.dir/build

eosio.system/CMakeFiles/eosio.system.wasm.dir/requires: eosio.system/CMakeFiles/eosio.system.wasm.dir/src/eosio.system.cpp.o.requires

.PHONY : eosio.system/CMakeFiles/eosio.system.wasm.dir/requires

eosio.system/CMakeFiles/eosio.system.wasm.dir/clean:
	cd /home/ubuntu/eosio.contracts/build/eosio.system && $(CMAKE_COMMAND) -P CMakeFiles/eosio.system.wasm.dir/cmake_clean.cmake
.PHONY : eosio.system/CMakeFiles/eosio.system.wasm.dir/clean

eosio.system/CMakeFiles/eosio.system.wasm.dir/depend:
	cd /home/ubuntu/eosio.contracts/build && $(CMAKE_COMMAND) -E cmake_depends "Unix Makefiles" /home/ubuntu/eosio.contracts /home/ubuntu/eosio.contracts/eosio.system /home/ubuntu/eosio.contracts/build /home/ubuntu/eosio.contracts/build/eosio.system /home/ubuntu/eosio.contracts/build/eosio.system/CMakeFiles/eosio.system.wasm.dir/DependInfo.cmake --color=$(COLOR)
.PHONY : eosio.system/CMakeFiles/eosio.system.wasm.dir/depend

