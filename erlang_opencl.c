
#include "erlang_opencl.h"
#include <stdio.h>
#include <CL/cl.h>

int foo(int x)
{
    printf("hello, world!\n");

    return x + 1;
}

int bar(int x)
{
    cl_int err;
    cl_uint numPlatforms;

    err = clGetPlatformIDs(0, NULL, &numPlatforms);
    if (CL_SUCCESS == err)
        printf("\nDetected OpenCL platforms: %d\n", numPlatforms);
    else
        printf("\nError calling clGetPlatformIDs. Error code: %d", err);



    return x - 1;
}
