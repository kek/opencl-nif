defmodule OpenCLTest do
  use ExUnit.Case
  doctest :erlang_opencl

  test "can run something on the OpenCL API" do
    assert :erlang_opencl.get_number_of_platforms() == 1
  end
end
