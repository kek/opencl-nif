cmake -S . -B build\windows
call vsenv.bat
msbuild build\windows\ErlangOpenCL.sln
