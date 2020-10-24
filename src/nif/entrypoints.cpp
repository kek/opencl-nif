#include <CL/cl.h>
#include <stdio.h>

#include "Misc.h"
#include "compute.h"

int num_platforms(int _x)
{
    cl_int err;
    cl_uint numPlatforms;

    err = clGetPlatformIDs(0, NULL, &numPlatforms);
    if (CL_SUCCESS == err) {
        printf("\nDetected OpenCL platforms: %d\n", numPlatforms);
    }
    else {
        printf("\nError calling clGetPlatformIDs. Error code: %d", err);
    }

    return numPlatforms;
}

int scratch()
{
    Misc *misc = new Misc();
    int one = misc->one();
    compute();
    return one;
}
