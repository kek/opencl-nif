defmodule OpenCLTest do
  use ExUnit.Case
  doctest :opencl

  test "can run something on the OpenCL API" do
    assert :opencl.get_number_of_platforms() == 1
  end
end
