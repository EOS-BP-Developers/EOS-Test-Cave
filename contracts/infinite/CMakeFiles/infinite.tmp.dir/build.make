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

# Include any dependencies generated for this target.
include contracts/infinite/CMakeFiles/infinite.tmp.dir/depend.make

# Include the progress variables for this target.
include contracts/infinite/CMakeFiles/infinite.tmp.dir/progress.make

# Include the compile flags for this target's objects.
include contracts/infinite/CMakeFiles/infinite.tmp.dir/flags.make

contracts/infinite/CMakeFiles/infinite.tmp.dir/infinite.cpp.o: contracts/infinite/CMakeFiles/infinite.tmp.dir/flags.make
contracts/infinite/CMakeFiles/infinite.tmp.dir/infinite.cpp.o: ../contracts/infinite/infinite.cpp
	@$(CMAKE_COMMAND) -E cmake_echo_color --switch=$(COLOR) --green --progress-dir=/home/ubuntu/eos/build/CMakeFiles --progress-num=$(CMAKE_PROGRESS_1) "Building CXX object contracts/infinite/CMakeFiles/infinite.tmp.dir/infinite.cpp.o"
	cd /home/ubuntu/eos/build/contracts/infinite && /usr/bin/clang++-4.0  $(CXX_DEFINES) $(CXX_INCLUDES) $(CXX_FLAGS) -o CMakeFiles/infinite.tmp.dir/infinite.cpp.o -c /home/ubuntu/eos/contracts/infinite/infinite.cpp

contracts/infinite/CMakeFiles/infinite.tmp.dir/infinite.cpp.i: cmake_force
	@$(CMAKE_COMMAND) -E cmake_echo_color --switch=$(COLOR) --green "Preprocessing CXX source to CMakeFiles/infinite.tmp.dir/infinite.cpp.i"
	cd /home/ubuntu/eos/build/contracts/infinite && /usr/bin/clang++-4.0 $(CXX_DEFINES) $(CXX_INCLUDES) $(CXX_FLAGS) -E /home/ubuntu/eos/contracts/infinite/infinite.cpp > CMakeFiles/infinite.tmp.dir/infinite.cpp.i

contracts/infinite/CMakeFiles/infinite.tmp.dir/infinite.cpp.s: cmake_force
	@$(CMAKE_COMMAND) -E cmake_echo_color --switch=$(COLOR) --green "Compiling CXX source to assembly CMakeFiles/infinite.tmp.dir/infinite.cpp.s"
	cd /home/ubuntu/eos/build/contracts/infinite && /usr/bin/clang++-4.0 $(CXX_DEFINES) $(CXX_INCLUDES) $(CXX_FLAGS) -S /home/ubuntu/eos/contracts/infinite/infinite.cpp -o CMakeFiles/infinite.tmp.dir/infinite.cpp.s

contracts/infinite/CMakeFiles/infinite.tmp.dir/infinite.cpp.o.requires:

.PHONY : contracts/infinite/CMakeFiles/infinite.tmp.dir/infinite.cpp.o.requires

contracts/infinite/CMakeFiles/infinite.tmp.dir/infinite.cpp.o.provides: contracts/infinite/CMakeFiles/infinite.tmp.dir/infinite.cpp.o.requires
	$(MAKE) -f contracts/infinite/CMakeFiles/infinite.tmp.dir/build.make contracts/infinite/CMakeFiles/infinite.tmp.dir/infinite.cpp.o.provides.build
.PHONY : contracts/infinite/CMakeFiles/infinite.tmp.dir/infinite.cpp.o.provides

contracts/infinite/CMakeFiles/infinite.tmp.dir/infinite.cpp.o.provides.build: contracts/infinite/CMakeFiles/infinite.tmp.dir/infinite.cpp.o


# Object files for target infinite.tmp
infinite_tmp_OBJECTS = \
"CMakeFiles/infinite.tmp.dir/infinite.cpp.o"

# External object files for target infinite.tmp
infinite_tmp_EXTERNAL_OBJECTS =

contracts/infinite/infinite.tmp: contracts/infinite/CMakeFiles/infinite.tmp.dir/infinite.cpp.o
contracts/infinite/infinite.tmp: contracts/infinite/CMakeFiles/infinite.tmp.dir/build.make
contracts/infinite/infinite.tmp: contracts/infinite/CMakeFiles/infinite.tmp.dir/link.txt
	@$(CMAKE_COMMAND) -E cmake_echo_color --switch=$(COLOR) --green --bold --progress-dir=/home/ubuntu/eos/build/CMakeFiles --progress-num=$(CMAKE_PROGRESS_2) "Linking CXX executable infinite.tmp"
	cd /home/ubuntu/eos/build/contracts/infinite && $(CMAKE_COMMAND) -E cmake_link_script CMakeFiles/infinite.tmp.dir/link.txt --verbose=$(VERBOSE)

# Rule to build all files generated by this target.
contracts/infinite/CMakeFiles/infinite.tmp.dir/build: contracts/infinite/infinite.tmp

.PHONY : contracts/infinite/CMakeFiles/infinite.tmp.dir/build

contracts/infinite/CMakeFiles/infinite.tmp.dir/requires: contracts/infinite/CMakeFiles/infinite.tmp.dir/infinite.cpp.o.requires

.PHONY : contracts/infinite/CMakeFiles/infinite.tmp.dir/requires

contracts/infinite/CMakeFiles/infinite.tmp.dir/clean:
	cd /home/ubuntu/eos/build/contracts/infinite && $(CMAKE_COMMAND) -P CMakeFiles/infinite.tmp.dir/cmake_clean.cmake
.PHONY : contracts/infinite/CMakeFiles/infinite.tmp.dir/clean

contracts/infinite/CMakeFiles/infinite.tmp.dir/depend:
	cd /home/ubuntu/eos/build && $(CMAKE_COMMAND) -E cmake_depends "Unix Makefiles" /home/ubuntu/eos /home/ubuntu/eos/contracts/infinite /home/ubuntu/eos/build /home/ubuntu/eos/build/contracts/infinite /home/ubuntu/eos/build/contracts/infinite/CMakeFiles/infinite.tmp.dir/DependInfo.cmake --color=$(COLOR)
.PHONY : contracts/infinite/CMakeFiles/infinite.tmp.dir/depend

