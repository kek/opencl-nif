#include <CL/cl.h>
#include <stdio.h>
#include <stdlib.h>

#include "compute.h"
#include "source.h"

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
    Source source = read_source();

    for (int i = 0; i < 1; i++) {
        printf("Compute iteration %d\n", i + 1);
        cl_compute(source);
    }

    free(source.source_str);

    return 1;
}

int compute(char* source_string)
{
    printf("Source: %s ...", source_string);

    Source source;
    source.source_str = source_string;
    source.source_size = strlen(source_string);
    cl_compute(source);
    return 0;
}
