cmake -S . -B _build\nif
call script\vsenv.bat
msbuild -v:m _build\nif\OpenCL_NIF.sln
