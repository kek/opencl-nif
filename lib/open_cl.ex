defmodule :opencl do
  @spec get_number_of_platforms :: any | no_return
  def get_number_of_platforms do
    num_platforms(0)
  end

  @on_load :init

  @spec init :: :ok
  def init, do: :ok = :erlang.load_nif('./priv/windows/opencl_nif', 0)

  @spec num_platforms(any) :: any
  def num_platforms(_x), do: exit(:nif_library_not_loaded)
end
