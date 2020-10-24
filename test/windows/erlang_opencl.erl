-module(erlang_opencl).

-export([bar/0, bar/1, foo/1]).

-on_load({init, 0}).

init() ->
    ok =
        erlang:load_nif("./build/windows/Debug/erlang_opencl_nif",
                        0).

foo(_X) -> exit(nif_library_not_loaded).

bar(_Y) -> exit(nif_library_not_loaded).

bar() -> bar(1).
