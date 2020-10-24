cmake -S . -B _build\nif
call script\vsenv.bat
msbuild _build\nif\OpenCL_NIF.sln
