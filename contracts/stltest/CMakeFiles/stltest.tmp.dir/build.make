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
include contracts/stltest/CMakeFiles/stltest.tmp.dir/depend.make

# Include the progress variables for this target.
include contracts/stltest/CMakeFiles/stltest.tmp.dir/progress.make

# Include the compile flags for this target's objects.
include contracts/stltest/CMakeFiles/stltest.tmp.dir/flags.make

contracts/stltest/CMakeFiles/stltest.tmp.dir/stltest.cpp.o: contracts/stltest/CMakeFiles/stltest.tmp.dir/flags.make
contracts/stltest/CMakeFiles/stltest.tmp.dir/stltest.cpp.o: ../contracts/stltest/stltest.cpp
	@$(CMAKE_COMMAND) -E cmake_echo_color --switch=$(COLOR) --green --progress-dir=/home/ubuntu/eos/build/CMakeFiles --progress-num=$(CMAKE_PROGRESS_1) "Building CXX object contracts/stltest/CMakeFiles/stltest.tmp.dir/stltest.cpp.o"
	cd /home/ubuntu/eos/build/contracts/stltest && /usr/bin/clang++-4.0  $(CXX_DEFINES) $(CXX_INCLUDES) $(CXX_FLAGS) -o CMakeFiles/stltest.tmp.dir/stltest.cpp.o -c /home/ubuntu/eos/contracts/stltest/stltest.cpp

contracts/stltest/CMakeFiles/stltest.tmp.dir/stltest.cpp.i: cmake_force
	@$(CMAKE_COMMAND) -E cmake_echo_color --switch=$(COLOR) --green "Preprocessing CXX source to CMakeFiles/stltest.tmp.dir/stltest.cpp.i"
	cd /home/ubuntu/eos/build/contracts/stltest && /usr/bin/clang++-4.0 $(CXX_DEFINES) $(CXX_INCLUDES) $(CXX_FLAGS) -E /home/ubuntu/eos/contracts/stltest/stltest.cpp > CMakeFiles/stltest.tmp.dir/stltest.cpp.i

contracts/stltest/CMakeFiles/stltest.tmp.dir/stltest.cpp.s: cmake_force
	@$(CMAKE_COMMAND) -E cmake_echo_color --switch=$(COLOR) --green "Compiling CXX source to assembly CMakeFiles/stltest.tmp.dir/stltest.cpp.s"
	cd /home/ubuntu/eos/build/contracts/stltest && /usr/bin/clang++-4.0 $(CXX_DEFINES) $(CXX_INCLUDES) $(CXX_FLAGS) -S /home/ubuntu/eos/contracts/stltest/stltest.cpp -o CMakeFiles/stltest.tmp.dir/stltest.cpp.s

contracts/stltest/CMakeFiles/stltest.tmp.dir/stltest.cpp.o.requires:

.PHONY : contracts/stltest/CMakeFiles/stltest.tmp.dir/stltest.cpp.o.requires

contracts/stltest/CMakeFiles/stltest.tmp.dir/stltest.cpp.o.provides: contracts/stltest/CMakeFiles/stltest.tmp.dir/stltest.cpp.o.requires
	$(MAKE) -f contracts/stltest/CMakeFiles/stltest.tmp.dir/build.make contracts/stltest/CMakeFiles/stltest.tmp.dir/stltest.cpp.o.provides.build
.PHONY : contracts/stltest/CMakeFiles/stltest.tmp.dir/stltest.cpp.o.provides

contracts/stltest/CMakeFiles/stltest.tmp.dir/stltest.cpp.o.provides.build: contracts/stltest/CMakeFiles/stltest.tmp.dir/stltest.cpp.o


# Object files for target stltest.tmp
stltest_tmp_OBJECTS = \
"CMakeFiles/stltest.tmp.dir/stltest.cpp.o"

# External object files for target stltest.tmp
stltest_tmp_EXTERNAL_OBJECTS =

contracts/stltest/stltest.tmp: contracts/stltest/CMakeFiles/stltest.tmp.dir/stltest.cpp.o
contracts/stltest/stltest.tmp: contracts/stltest/CMakeFiles/stltest.tmp.dir/build.make
contracts/stltest/stltest.tmp: contracts/stltest/CMakeFiles/stltest.tmp.dir/link.txt
	@$(CMAKE_COMMAND) -E cmake_echo_color --switch=$(COLOR) --green --bold --progress-dir=/home/ubuntu/eos/build/CMakeFiles --progress-num=$(CMAKE_PROGRESS_2) "Linking CXX executable stltest.tmp"
	cd /home/ubuntu/eos/build/contracts/stltest && $(CMAKE_COMMAND) -E cmake_link_script CMakeFiles/stltest.tmp.dir/link.txt --verbose=$(VERBOSE)

# Rule to build all files generated by this target.
contracts/stltest/CMakeFiles/stltest.tmp.dir/build: contracts/stltest/stltest.tmp

.PHONY : contracts/stltest/CMakeFiles/stltest.tmp.dir/build

contracts/stltest/CMakeFiles/stltest.tmp.dir/requires: contracts/stltest/CMakeFiles/stltest.tmp.dir/stltest.cpp.o.requires

.PHONY : contracts/stltest/CMakeFiles/stltest.tmp.dir/requires

contracts/stltest/CMakeFiles/stltest.tmp.dir/clean:
	cd /home/ubuntu/eos/build/contracts/stltest && $(CMAKE_COMMAND) -P CMakeFiles/stltest.tmp.dir/cmake_clean.cmake
.PHONY : contracts/stltest/CMakeFiles/stltest.tmp.dir/clean

contracts/stltest/CMakeFiles/stltest.tmp.dir/depend:
	cd /home/ubuntu/eos/build && $(CMAKE_COMMAND) -E cmake_depends "Unix Makefiles" /home/ubuntu/eos /home/ubuntu/eos/contracts/stltest /home/ubuntu/eos/build /home/ubuntu/eos/build/contracts/stltest /home/ubuntu/eos/build/contracts/stltest/CMakeFiles/stltest.tmp.dir/DependInfo.cmake --color=$(COLOR)
.PHONY : contracts/stltest/CMakeFiles/stltest.tmp.dir/depend

