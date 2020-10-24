call script\build_nif.bat
erlc -o test\windows test\windows\opencl.erl
erl -pa test\windows -noshell -s opencl print_number_of_platforms -s init stop
