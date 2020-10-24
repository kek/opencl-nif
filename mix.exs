defmodule Mix.Tasks.Compile.Nif do
  def run(_args) do
    case System.cmd("script/build_nif.bat", [], stderr_to_stdout: true) do
      {_result, 0} ->
        File.mkdir_p!("priv/windows")
        File.copy!("build/Debug/erlang_opencl_nif.dll", "priv/windows/erlang_opencl_nif.dll")
        :ok

      {result, error_code} ->
        IO.puts("NIF compile error #{error_code}")
        IO.binwrite(result)
        {:error, ["NIF compile error #{error_code}"]}
    end
  end
end

defmodule OpenCL.MixProject do
  use Mix.Project

  def project do
    [
      app: :opencl,
      compilers: [:nif] ++ Mix.compilers(),
      version: "0.1.0",
      elixir: "~> 1.11",
      start_permanent: Mix.env() == :prod,
      deps: deps()
    ]
  end

  def application do
    [
      extra_applications: [:logger]
    ]
  end

  defp deps do
    [
      {:mix_test_watch, "~> 1.0"}
    ]
  end
end
