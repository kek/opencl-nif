defmodule Mix.Tasks.Compile.Nif do
  def run(_args) do
    {_result, 0} = System.cmd("script/build_nif.bat", [], stderr_to_stdout: true)
    File.mkdir_p!("priv/windows")
    File.copy!("build/Debug/erlang_opencl_nif.dll", "priv/windows/erlang_opencl_nif.dll")
    # IO.binwrite(result)
    :ok
  end
end

defmodule OpenCL.MixProject do
  use Mix.Project

  def project do
    [
      app: :opencl,
      compilers: [:nif] ++ Mix.compilers,
      version: "0.1.0",
      elixir: "~> 1.11",
      start_permanent: Mix.env() == :prod,
      deps: deps()
    ]
  end

  # Run "mix help compile.app" to learn about applications.
  def application do
    [
      extra_applications: [:logger]
    ]
  end

  # Run "mix help deps" to learn about dependencies.
  defp deps do
    [
      # {:dep_from_hexpm, "~> 0.3.0"},
      # {:dep_from_git, git: "https://github.com/elixir-lang/my_dep.git", tag: "0.1.0"}
    ]
  end
end
