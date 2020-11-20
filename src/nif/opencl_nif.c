#include <erl_nif.h>
#include <string.h>

#include "compute.h"

extern int num_platforms(int z);
extern int scratch();

#include <stdio.h>

#define MAX_SOURCE_SIZE 5000

static ERL_NIF_TERM num_platforms_nif(ErlNifEnv *env, int argc, const ERL_NIF_TERM argv[])
{
    int x, ret;
    if (!enif_get_int(env, argv[0], &x)) {
        return enif_make_badarg(env);
    }
    ret = num_platforms(x);
    return enif_make_int(env, ret);
}

static ERL_NIF_TERM sandbox_nif(ErlNifEnv *env, int argc, const ERL_NIF_TERM argv[])
{
    int ret;
    ret = scratch();
    return enif_make_int(env, ret);
}

static ERL_NIF_TERM compute_nif(ErlNifEnv *env, int argc, const ERL_NIF_TERM argv[])
{
    char *source_str;
    if (!(source_str = malloc(MAX_SOURCE_SIZE))) {
        fprintf(stderr, "Out of memory.\n");
        exit(1);
    }

    int ret = enif_get_string(env, argv[0], source_str, MAX_SOURCE_SIZE, ERL_NIF_LATIN1);
    printf("enif_get_string returned %d\n", ret);
    if (ret == 0) {
        printf("no source");
        return enif_make_badarg(env);
    }
    ret = compute(source_str);
    // free(source_str);
    return enif_make_int(env, ret);
}

static ErlNifFunc nif_funcs[] = {
    {"num_platforms", 1, num_platforms_nif, ERL_NIF_DIRTY_JOB_IO_BOUND},
    {"scratch", 0, sandbox_nif, ERL_NIF_DIRTY_JOB_IO_BOUND},
    {"compute", 1, compute_nif, ERL_NIF_DIRTY_JOB_IO_BOUND}};

ERL_NIF_INIT(opencl, nif_funcs, NULL, NULL, NULL, NULL)
