# CMakeList.txt : CMake project for ErlangOpenCL, include source and define
# project specific logic here.
#
cmake_minimum_required (VERSION 3.8)

project ("ErlangOpenCL")

include_directories(
  SYSTEM
  "$ENV{ERLANG_HOME}/usr/include"
)

# Add source to this project's executable.
add_library (erlang_opencl_nif SHARED "erlang_opencl.c" "erlang_opencl.h" "erlang_opencl_nif.c")

# TODO: Add tests and install targets if needed.
