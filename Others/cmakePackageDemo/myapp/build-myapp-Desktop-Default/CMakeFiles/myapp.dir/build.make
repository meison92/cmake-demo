# CMAKE generated file: DO NOT EDIT!
# Generated by "Unix Makefiles" Generator, CMake Version 3.11

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
CMAKE_COMMAND = /home/rootroot/ProgramFiles/cmake3.11.1/bin/cmake

# The command to remove a file.
RM = /home/rootroot/ProgramFiles/cmake3.11.1/bin/cmake -E remove -f

# Escaping for special characters.
EQUALS = =

# The top-level source directory on which CMake was run.
CMAKE_SOURCE_DIR = /home/rootroot/newworkspace/myapp

# The top-level build directory on which CMake was run.
CMAKE_BINARY_DIR = /home/rootroot/newworkspace/myapp/build-myapp-Desktop-Default

# Include any dependencies generated for this target.
include CMakeFiles/myapp.dir/depend.make

# Include the progress variables for this target.
include CMakeFiles/myapp.dir/progress.make

# Include the compile flags for this target's objects.
include CMakeFiles/myapp.dir/flags.make

CMakeFiles/myapp.dir/myapp.c.o: CMakeFiles/myapp.dir/flags.make
CMakeFiles/myapp.dir/myapp.c.o: ../myapp.c
	@$(CMAKE_COMMAND) -E cmake_echo_color --switch=$(COLOR) --green --progress-dir=/home/rootroot/newworkspace/myapp/build-myapp-Desktop-Default/CMakeFiles --progress-num=$(CMAKE_PROGRESS_1) "Building C object CMakeFiles/myapp.dir/myapp.c.o"
	/usr/bin/cc $(C_DEFINES) $(C_INCLUDES) $(C_FLAGS) -o CMakeFiles/myapp.dir/myapp.c.o   -c /home/rootroot/newworkspace/myapp/myapp.c

CMakeFiles/myapp.dir/myapp.c.i: cmake_force
	@$(CMAKE_COMMAND) -E cmake_echo_color --switch=$(COLOR) --green "Preprocessing C source to CMakeFiles/myapp.dir/myapp.c.i"
	/usr/bin/cc $(C_DEFINES) $(C_INCLUDES) $(C_FLAGS) -E /home/rootroot/newworkspace/myapp/myapp.c > CMakeFiles/myapp.dir/myapp.c.i

CMakeFiles/myapp.dir/myapp.c.s: cmake_force
	@$(CMAKE_COMMAND) -E cmake_echo_color --switch=$(COLOR) --green "Compiling C source to assembly CMakeFiles/myapp.dir/myapp.c.s"
	/usr/bin/cc $(C_DEFINES) $(C_INCLUDES) $(C_FLAGS) -S /home/rootroot/newworkspace/myapp/myapp.c -o CMakeFiles/myapp.dir/myapp.c.s

# Object files for target myapp
myapp_OBJECTS = \
"CMakeFiles/myapp.dir/myapp.c.o"

# External object files for target myapp
myapp_EXTERNAL_OBJECTS =

myapp: CMakeFiles/myapp.dir/myapp.c.o
myapp: CMakeFiles/myapp.dir/build.make
myapp: /home/rootroot/newworkspace/mylib/install/lib/libmylib.a
myapp: CMakeFiles/myapp.dir/link.txt
	@$(CMAKE_COMMAND) -E cmake_echo_color --switch=$(COLOR) --green --bold --progress-dir=/home/rootroot/newworkspace/myapp/build-myapp-Desktop-Default/CMakeFiles --progress-num=$(CMAKE_PROGRESS_2) "Linking C executable myapp"
	$(CMAKE_COMMAND) -E cmake_link_script CMakeFiles/myapp.dir/link.txt --verbose=$(VERBOSE)

# Rule to build all files generated by this target.
CMakeFiles/myapp.dir/build: myapp

.PHONY : CMakeFiles/myapp.dir/build

CMakeFiles/myapp.dir/clean:
	$(CMAKE_COMMAND) -P CMakeFiles/myapp.dir/cmake_clean.cmake
.PHONY : CMakeFiles/myapp.dir/clean

CMakeFiles/myapp.dir/depend:
	cd /home/rootroot/newworkspace/myapp/build-myapp-Desktop-Default && $(CMAKE_COMMAND) -E cmake_depends "Unix Makefiles" /home/rootroot/newworkspace/myapp /home/rootroot/newworkspace/myapp /home/rootroot/newworkspace/myapp/build-myapp-Desktop-Default /home/rootroot/newworkspace/myapp/build-myapp-Desktop-Default /home/rootroot/newworkspace/myapp/build-myapp-Desktop-Default/CMakeFiles/myapp.dir/DependInfo.cmake --color=$(COLOR)
.PHONY : CMakeFiles/myapp.dir/depend

