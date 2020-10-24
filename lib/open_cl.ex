defmodule :erlang_opencl do
  def get_number_of_platforms do
    num_platforms(0)
  end

  @on_load :init

  def init, do: :ok = :erlang.load_nif('./build/Debug/erlang_opencl_nif', 0)

  def foo(_x), do: exit(:nif_library_not_loaded)

  def bar(_x), do: exit(:nif_library_not_loaded)

  def num_platforms(_x), do: exit(:nif_library_not_loaded)
end
