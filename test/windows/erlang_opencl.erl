-module(erlang_opencl).

-export([bar/1,
         foo/1,
         num_platforms/1,
         print_number_of_platforms/0]).

-on_load({init, 0}).

init() ->
    ok = erlang:load_nif("./build/Debug/erlang_opencl_nif",
                         0).

foo(_X) -> exit(nif_library_not_loaded).

bar(_Y) -> exit(nif_library_not_loaded).

num_platforms(_Z) -> exit(nif_library_not_loaded).

print_number_of_platforms() ->
    NumPlatforms = num_platforms(0),
    NumPlatformsStr = io_lib:format("~p", [NumPlatforms]),
    io:put_chars(NumPlatformsStr).
