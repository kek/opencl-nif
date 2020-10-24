call script\build_nif.bat
erlc -o script script\opencl.erl
erl -pa script -noshell -s opencl print_number_of_platforms -s init stop
