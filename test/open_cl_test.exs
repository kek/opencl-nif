defmodule OpenCLTest do
  use ExUnit.Case
  doctest :opencl

  test "can run something on the OpenCL API" do
    assert :opencl.get_number_of_platforms() == 1
  end

  test "scratch function returns whatever" do
    assert :opencl.scratch() == 1
  end

  test "pass source code to nif" do
    source =
      """
      __kernel void vector_add(__global const int *A, __global const int *B, __global int *C) {

          // Get the index of the current element to be processed
          int i = get_global_id(0);

          // Do the operation
          C[i] = A[i] + B[i];
      }
      """
      |> String.to_charlist()

    assert :opencl.compute(source) == 0
  end
end
