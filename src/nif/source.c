#include "source.h"

#include <stdio.h>
#include <stdlib.h>

#define MAX_SOURCE_SIZE (0x100000)

Source read_source()
{
    FILE* fp;

    Source source;
    fp = fopen("priv/vector_add_kernel.cl", "r");
    if (!fp) {
        fprintf(stderr, "Failed to load kernel.\n");
        exit(1);
    }
    source.source_str = (char*)malloc(MAX_SOURCE_SIZE);
    source.source_size = fread(source.source_str, 1, MAX_SOURCE_SIZE, fp);
    fclose(fp);

    return source;
}
