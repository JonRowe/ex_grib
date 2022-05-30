defmodule ExGrib do
  @moduledoc """
  ExGrib is a library for reading GRIB files in Elixir.
  """

  alias ExGrib.Grib1
  alias ExGrib.Grib2

  @spec parse_all(binary()) :: {:ok, list(Grib2.t())} | {:error, String.t()}
  def parse_all(binary) do
    with {:ok, grib, more} <- parse(binary), {:ok, gribs} <- parse_all(more) do
      {:ok, [grib | gribs]}
    else
      {:ok, grib} -> {:ok, [grib]}
      {:error, message} -> {:error, message}
    end
  end

  @spec parse(binary()) :: {:ok, Grib2.t(), binary()} | {:ok, Grib2.t()} | {:error, String.t()}
  # NUL seperators can be ignored
  def parse(<<0, 0, rest::binary()>>), do: parse(rest)

  def parse(binary) do
    cond do
      true == Grib1.detect(binary) -> Grib1.parse(binary)
      true == Grib2.detect(binary) -> Grib2.parse(binary)
      true -> {:error, "No grib file detected"}
    end
  end
end
