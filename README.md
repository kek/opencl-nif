- Requires Windows (Visual Studio)
- Probably requires AMD GPU
- Requires "OCL_SDK_Light" https://github.com/GPUOpen-LibrariesAndSDKs/OCL-SDK/releases
- Requires OCL_ROOT to be set to wherever that is installed and ERLANG_HOME to be set to wherever Erlang is installed

## Stop opencl_nif.dll from being locked

If using VS Code with the most popular Erlang extension, recompilation will fail because the NIF is locked, put the following in your workspace settings:

```
    "erlang.linting": false,
```
