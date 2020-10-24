#include <erl_nif.h>
#include <string.h>

extern int num_platforms(int z);
extern int scratch();

#include <stdio.h>

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
    ret = 0;
    return enif_make_int(env, ret);
}

static ErlNifFunc nif_funcs[] = {
    {"num_platforms", 1, num_platforms_nif},
    {"scratch", 0, sandbox_nif}
};

ERL_NIF_INIT(opencl, nif_funcs, NULL, NULL, NULL, NULL)
