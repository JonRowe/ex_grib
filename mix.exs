defmodule ExGrib.MixProject do
  use Mix.Project

  @version "0.0.1"

  def project do
    [
      app: :ex_grib,
      deps: deps(),
      description: "An Elixir parser for Grib2 files.",
      dialyzer: dialyzer(),
      docs: docs(),
      elixir: "~> 1.12",
      elixirc_options: [warnings_as_errors: true],
      elixirc_paths: code(Mix.env()),
      package: package(),
      start_permanent: Mix.env() == :prod,
      version: @version
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
      {:dialyxir, "~> 1.1", only: [:dev]},
      {:ex_doc, ">= 0.0.0", only: :dev, runtime: false}
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

  defp docs do
    [
      main: "readme",
      extras: ["README.md"],
      source_ref: "v#{@version}",
      source_url: "https://github.com/JonRowe/ex_grib"
    ]
  end

  defp package do
    [
      maintainers: ["Jon Rowe"],
      licenses: [],
      links: %{github: "https://github.com/JonRowe/ex_grib"},
      files: ~w(lib) ++ ~w(mix.exs README.md)
    ]
  end
end
