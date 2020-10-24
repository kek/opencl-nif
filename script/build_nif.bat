cmake -S c_src -B build
call script\vsenv.bat
msbuild build\ErlangOpenCL.sln
