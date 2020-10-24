# CMakeList.txt : CMake project for ErlangOpenCL, include source and define
# project specific logic here.
#
cmake_minimum_required (VERSION 3.8)

project ("OpenCL_NIF")

include_directories(
	SYSTEM
	"$ENV{ERLANG_HOME}/usr/include"
	"$ENV{OCL_ROOT}/include"
	"src/nif"
)

link_directories(
	SYSTEM
	"$ENV{OCL_ROOT}/lib/x86_64"
)

# Add source to this project's executable.
add_library(
	opencl_nif SHARED
	"src/nif/Misc.h"
	"src/nif/compute.cpp"
	"src/nif/Misc.cpp"
	"src/nif/opencl_nif.cpp"
	"src/nif/entrypoints.cpp"
)

target_link_libraries(opencl_nif "OpenCL")

# TODO: Add tests and install targets if needed.
