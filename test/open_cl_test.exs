defmodule OpenCLTest do
  use ExUnit.Case
  doctest OpenCL

  test "greets the world" do
    assert OpenCL.hello() == :world
  end
end
