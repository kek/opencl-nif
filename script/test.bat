call script\build_nif.bat
erlc -o test\windows test\windows\erlang_opencl.erl
erl -pa test\windows -noshell -s erlang_opencl print_number_of_platforms -s init stop
