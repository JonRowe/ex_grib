defmodule ExGrib.MixProject do
  use Mix.Project

  def project do
    [
      app: :ex_grib,
      version: "0.1.0",
      elixir: "~> 1.12",
      elixirc_options: [warnings_as_errors: true],
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
    []
  end
end
