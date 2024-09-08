# CMAKE generated file: DO NOT EDIT!
# Generated by "Unix Makefiles" Generator, CMake Version 3.30

# Delete rule output on recipe failure.
.DELETE_ON_ERROR:

#=============================================================================
# Special targets provided by cmake.

# Disable implicit rules so canonical targets will work.
.SUFFIXES:

# Disable VCS-based implicit rules.
% : %,v

# Disable VCS-based implicit rules.
% : RCS/%

# Disable VCS-based implicit rules.
% : RCS/%,v

# Disable VCS-based implicit rules.
% : SCCS/s.%

# Disable VCS-based implicit rules.
% : s.%

.SUFFIXES: .hpux_make_needs_suffix_list

# Command-line flag to silence nested $(MAKE).
$(VERBOSE)MAKESILENT = -s

#Suppress display of executed commands.
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
RM = /usr/bin/cmake -E rm -f

# Escaping for special characters.
EQUALS = =

# The top-level source directory on which CMake was run.
CMAKE_SOURCE_DIR = /home/lilly/ProgPort/repapx

# The top-level build directory on which CMake was run.
CMAKE_BINARY_DIR = /home/lilly/ProgPort/repapx/build

# Include any dependencies generated for this target.
include CMakeFiles/repapx.dir/depend.make
# Include any dependencies generated by the compiler for this target.
include CMakeFiles/repapx.dir/compiler_depend.make

# Include the progress variables for this target.
include CMakeFiles/repapx.dir/progress.make

# Include the compile flags for this target's objects.
include CMakeFiles/repapx.dir/flags.make

CMakeFiles/repapx.dir/src/repapx.c.o: CMakeFiles/repapx.dir/flags.make
CMakeFiles/repapx.dir/src/repapx.c.o: /home/lilly/ProgPort/repapx/src/repapx.c
CMakeFiles/repapx.dir/src/repapx.c.o: CMakeFiles/repapx.dir/compiler_depend.ts
	@$(CMAKE_COMMAND) -E cmake_echo_color "--switch=$(COLOR)" --green --progress-dir=/home/lilly/ProgPort/repapx/build/CMakeFiles --progress-num=$(CMAKE_PROGRESS_1) "Building C object CMakeFiles/repapx.dir/src/repapx.c.o"
	/usr/bin/cc $(C_DEFINES) $(C_INCLUDES) $(C_FLAGS) -MD -MT CMakeFiles/repapx.dir/src/repapx.c.o -MF CMakeFiles/repapx.dir/src/repapx.c.o.d -o CMakeFiles/repapx.dir/src/repapx.c.o -c /home/lilly/ProgPort/repapx/src/repapx.c

CMakeFiles/repapx.dir/src/repapx.c.i: cmake_force
	@$(CMAKE_COMMAND) -E cmake_echo_color "--switch=$(COLOR)" --green "Preprocessing C source to CMakeFiles/repapx.dir/src/repapx.c.i"
	/usr/bin/cc $(C_DEFINES) $(C_INCLUDES) $(C_FLAGS) -E /home/lilly/ProgPort/repapx/src/repapx.c > CMakeFiles/repapx.dir/src/repapx.c.i

CMakeFiles/repapx.dir/src/repapx.c.s: cmake_force
	@$(CMAKE_COMMAND) -E cmake_echo_color "--switch=$(COLOR)" --green "Compiling C source to assembly CMakeFiles/repapx.dir/src/repapx.c.s"
	/usr/bin/cc $(C_DEFINES) $(C_INCLUDES) $(C_FLAGS) -S /home/lilly/ProgPort/repapx/src/repapx.c -o CMakeFiles/repapx.dir/src/repapx.c.s

CMakeFiles/repapx.dir/src/glad/glad.c.o: CMakeFiles/repapx.dir/flags.make
CMakeFiles/repapx.dir/src/glad/glad.c.o: /home/lilly/ProgPort/repapx/src/glad/glad.c
CMakeFiles/repapx.dir/src/glad/glad.c.o: CMakeFiles/repapx.dir/compiler_depend.ts
	@$(CMAKE_COMMAND) -E cmake_echo_color "--switch=$(COLOR)" --green --progress-dir=/home/lilly/ProgPort/repapx/build/CMakeFiles --progress-num=$(CMAKE_PROGRESS_2) "Building C object CMakeFiles/repapx.dir/src/glad/glad.c.o"
	/usr/bin/cc $(C_DEFINES) $(C_INCLUDES) $(C_FLAGS) -MD -MT CMakeFiles/repapx.dir/src/glad/glad.c.o -MF CMakeFiles/repapx.dir/src/glad/glad.c.o.d -o CMakeFiles/repapx.dir/src/glad/glad.c.o -c /home/lilly/ProgPort/repapx/src/glad/glad.c

CMakeFiles/repapx.dir/src/glad/glad.c.i: cmake_force
	@$(CMAKE_COMMAND) -E cmake_echo_color "--switch=$(COLOR)" --green "Preprocessing C source to CMakeFiles/repapx.dir/src/glad/glad.c.i"
	/usr/bin/cc $(C_DEFINES) $(C_INCLUDES) $(C_FLAGS) -E /home/lilly/ProgPort/repapx/src/glad/glad.c > CMakeFiles/repapx.dir/src/glad/glad.c.i

CMakeFiles/repapx.dir/src/glad/glad.c.s: cmake_force
	@$(CMAKE_COMMAND) -E cmake_echo_color "--switch=$(COLOR)" --green "Compiling C source to assembly CMakeFiles/repapx.dir/src/glad/glad.c.s"
	/usr/bin/cc $(C_DEFINES) $(C_INCLUDES) $(C_FLAGS) -S /home/lilly/ProgPort/repapx/src/glad/glad.c -o CMakeFiles/repapx.dir/src/glad/glad.c.s

# Object files for target repapx
repapx_OBJECTS = \
"CMakeFiles/repapx.dir/src/repapx.c.o" \
"CMakeFiles/repapx.dir/src/glad/glad.c.o"

# External object files for target repapx
repapx_EXTERNAL_OBJECTS =

librepapx.so: CMakeFiles/repapx.dir/src/repapx.c.o
librepapx.so: CMakeFiles/repapx.dir/src/glad/glad.c.o
librepapx.so: CMakeFiles/repapx.dir/build.make
librepapx.so: /usr/lib/libglfw.so.3.4
librepapx.so: CMakeFiles/repapx.dir/link.txt
	@$(CMAKE_COMMAND) -E cmake_echo_color "--switch=$(COLOR)" --green --bold --progress-dir=/home/lilly/ProgPort/repapx/build/CMakeFiles --progress-num=$(CMAKE_PROGRESS_3) "Linking C shared library librepapx.so"
	$(CMAKE_COMMAND) -E cmake_link_script CMakeFiles/repapx.dir/link.txt --verbose=$(VERBOSE)

# Rule to build all files generated by this target.
CMakeFiles/repapx.dir/build: librepapx.so
.PHONY : CMakeFiles/repapx.dir/build

CMakeFiles/repapx.dir/clean:
	$(CMAKE_COMMAND) -P CMakeFiles/repapx.dir/cmake_clean.cmake
.PHONY : CMakeFiles/repapx.dir/clean

CMakeFiles/repapx.dir/depend:
	cd /home/lilly/ProgPort/repapx/build && $(CMAKE_COMMAND) -E cmake_depends "Unix Makefiles" /home/lilly/ProgPort/repapx /home/lilly/ProgPort/repapx /home/lilly/ProgPort/repapx/build /home/lilly/ProgPort/repapx/build /home/lilly/ProgPort/repapx/build/CMakeFiles/repapx.dir/DependInfo.cmake "--color=$(COLOR)"
.PHONY : CMakeFiles/repapx.dir/depend

