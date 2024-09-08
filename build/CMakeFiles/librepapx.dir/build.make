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
include CMakeFiles/librepapx.dir/depend.make
# Include any dependencies generated by the compiler for this target.
include CMakeFiles/librepapx.dir/compiler_depend.make

# Include the progress variables for this target.
include CMakeFiles/librepapx.dir/progress.make

# Include the compile flags for this target's objects.
include CMakeFiles/librepapx.dir/flags.make

CMakeFiles/librepapx.dir/src/repap.c.o: CMakeFiles/librepapx.dir/flags.make
CMakeFiles/librepapx.dir/src/repap.c.o: /home/lilly/ProgPort/repapx/src/repap.c
CMakeFiles/librepapx.dir/src/repap.c.o: CMakeFiles/librepapx.dir/compiler_depend.ts
	@$(CMAKE_COMMAND) -E cmake_echo_color "--switch=$(COLOR)" --green --progress-dir=/home/lilly/ProgPort/repapx/build/CMakeFiles --progress-num=$(CMAKE_PROGRESS_1) "Building C object CMakeFiles/librepapx.dir/src/repap.c.o"
	/usr/bin/cc $(C_DEFINES) $(C_INCLUDES) $(C_FLAGS) -MD -MT CMakeFiles/librepapx.dir/src/repap.c.o -MF CMakeFiles/librepapx.dir/src/repap.c.o.d -o CMakeFiles/librepapx.dir/src/repap.c.o -c /home/lilly/ProgPort/repapx/src/repap.c

CMakeFiles/librepapx.dir/src/repap.c.i: cmake_force
	@$(CMAKE_COMMAND) -E cmake_echo_color "--switch=$(COLOR)" --green "Preprocessing C source to CMakeFiles/librepapx.dir/src/repap.c.i"
	/usr/bin/cc $(C_DEFINES) $(C_INCLUDES) $(C_FLAGS) -E /home/lilly/ProgPort/repapx/src/repap.c > CMakeFiles/librepapx.dir/src/repap.c.i

CMakeFiles/librepapx.dir/src/repap.c.s: cmake_force
	@$(CMAKE_COMMAND) -E cmake_echo_color "--switch=$(COLOR)" --green "Compiling C source to assembly CMakeFiles/librepapx.dir/src/repap.c.s"
	/usr/bin/cc $(C_DEFINES) $(C_INCLUDES) $(C_FLAGS) -S /home/lilly/ProgPort/repapx/src/repap.c -o CMakeFiles/librepapx.dir/src/repap.c.s

CMakeFiles/librepapx.dir/src/glad/glad.c.o: CMakeFiles/librepapx.dir/flags.make
CMakeFiles/librepapx.dir/src/glad/glad.c.o: /home/lilly/ProgPort/repapx/src/glad/glad.c
CMakeFiles/librepapx.dir/src/glad/glad.c.o: CMakeFiles/librepapx.dir/compiler_depend.ts
	@$(CMAKE_COMMAND) -E cmake_echo_color "--switch=$(COLOR)" --green --progress-dir=/home/lilly/ProgPort/repapx/build/CMakeFiles --progress-num=$(CMAKE_PROGRESS_2) "Building C object CMakeFiles/librepapx.dir/src/glad/glad.c.o"
	/usr/bin/cc $(C_DEFINES) $(C_INCLUDES) $(C_FLAGS) -MD -MT CMakeFiles/librepapx.dir/src/glad/glad.c.o -MF CMakeFiles/librepapx.dir/src/glad/glad.c.o.d -o CMakeFiles/librepapx.dir/src/glad/glad.c.o -c /home/lilly/ProgPort/repapx/src/glad/glad.c

CMakeFiles/librepapx.dir/src/glad/glad.c.i: cmake_force
	@$(CMAKE_COMMAND) -E cmake_echo_color "--switch=$(COLOR)" --green "Preprocessing C source to CMakeFiles/librepapx.dir/src/glad/glad.c.i"
	/usr/bin/cc $(C_DEFINES) $(C_INCLUDES) $(C_FLAGS) -E /home/lilly/ProgPort/repapx/src/glad/glad.c > CMakeFiles/librepapx.dir/src/glad/glad.c.i

CMakeFiles/librepapx.dir/src/glad/glad.c.s: cmake_force
	@$(CMAKE_COMMAND) -E cmake_echo_color "--switch=$(COLOR)" --green "Compiling C source to assembly CMakeFiles/librepapx.dir/src/glad/glad.c.s"
	/usr/bin/cc $(C_DEFINES) $(C_INCLUDES) $(C_FLAGS) -S /home/lilly/ProgPort/repapx/src/glad/glad.c -o CMakeFiles/librepapx.dir/src/glad/glad.c.s

# Object files for target librepapx
librepapx_OBJECTS = \
"CMakeFiles/librepapx.dir/src/repap.c.o" \
"CMakeFiles/librepapx.dir/src/glad/glad.c.o"

# External object files for target librepapx
librepapx_EXTERNAL_OBJECTS =

liblibrepapx.so: CMakeFiles/librepapx.dir/src/repap.c.o
liblibrepapx.so: CMakeFiles/librepapx.dir/src/glad/glad.c.o
liblibrepapx.so: CMakeFiles/librepapx.dir/build.make
liblibrepapx.so: /usr/lib/libglfw.so.3.4
liblibrepapx.so: CMakeFiles/librepapx.dir/link.txt
	@$(CMAKE_COMMAND) -E cmake_echo_color "--switch=$(COLOR)" --green --bold --progress-dir=/home/lilly/ProgPort/repapx/build/CMakeFiles --progress-num=$(CMAKE_PROGRESS_3) "Linking C shared library liblibrepapx.so"
	$(CMAKE_COMMAND) -E cmake_link_script CMakeFiles/librepapx.dir/link.txt --verbose=$(VERBOSE)

# Rule to build all files generated by this target.
CMakeFiles/librepapx.dir/build: liblibrepapx.so
.PHONY : CMakeFiles/librepapx.dir/build

CMakeFiles/librepapx.dir/clean:
	$(CMAKE_COMMAND) -P CMakeFiles/librepapx.dir/cmake_clean.cmake
.PHONY : CMakeFiles/librepapx.dir/clean

CMakeFiles/librepapx.dir/depend:
	cd /home/lilly/ProgPort/repapx/build && $(CMAKE_COMMAND) -E cmake_depends "Unix Makefiles" /home/lilly/ProgPort/repapx /home/lilly/ProgPort/repapx /home/lilly/ProgPort/repapx/build /home/lilly/ProgPort/repapx/build /home/lilly/ProgPort/repapx/build/CMakeFiles/librepapx.dir/DependInfo.cmake "--color=$(COLOR)"
.PHONY : CMakeFiles/librepapx.dir/depend

