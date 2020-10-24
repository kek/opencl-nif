cmake -S . -B build
call script\vsenv.bat
msbuild build\ErlangOpenCL.sln
