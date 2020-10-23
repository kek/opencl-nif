
#include "erlang_opencl.h"
#include <stdio.h>

int foo(int x)
{
    printf("hello, world!\n");

    return x + 1;
}

int bar(int x)
{
    return x - 1;
}
