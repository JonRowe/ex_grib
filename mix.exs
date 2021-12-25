defmodule ExGrib.MixProject do
  use Mix.Project

  def project do
    [
      app: :ex_grib,
      version: "0.1.0",
      elixir: "~> 1.12",
      elixirc_paths: code(Mix.env()),
      elixirc_options: [warnings_as_errors: true],
      start_permanent: Mix.env() == :prod,
      deps: deps(),
      dialyzer: dialyzer()
    ]
  end

  def application do
    [
      extra_applications: [:logger]
    ]
  end

  defp code(:test), do: ["lib", "test/support"]
  defp code(_), do: ["lib"]

  defp deps do
    [
      {:dialyxir, "~> 1.1", only: [:dev]}
    ]
  end

  defp dialyzer do
    [
      plt_add_deps: :app_tree,
      plt_add_apps: [:mix],
      check_plt: true,
      flags: [:error_handling, :race_conditions],
      ignore_warnings: "dialyzer_ignore.exs",
      list_unused_filters: true
    ]
  end
end
