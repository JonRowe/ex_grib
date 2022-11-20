defmodule ExGrib do
  @moduledoc """
  ExGrib is a library for reading GRIB files in Elixir.
  """

  alias ExGrib.Grib1
  alias ExGrib.Grib2

  @type options :: [] | Grib1.options()

  @spec find(list(Grib1.t() | Grib2.t()), list(keyword())) :: list(Grib1.t() | Grib2.t())
  def find(messages, query \\ []) do
    Enum.filter(messages, fn
      %Grib1{} = message -> Grib1.matches?(message, query)
      _ -> raise ArgumentError, "find/2 currently only supports Grib1"
    end)
  end

  @spec parse_all(binary(), options()) :: {:ok, list(Grib2.t())} | {:error, String.t()}
  def parse_all(binary, opts \\ []) do
    with {:ok, grib, more} <- parse(binary, opts), {:ok, gribs} <- parse_all(more, opts) do
      {:ok, [grib | gribs]}
    else
      {:ok, grib} -> {:ok, [grib]}
      {:error, message} -> {:error, message}
    end
  end

  @spec parse(binary(), options()) ::
          {:ok, Grib2.t(), binary()} | {:ok, Grib2.t()} | {:error, String.t()}
  def parse(binary, opts \\ [])

  # NUL seperators can be ignored
  def parse(<<0, 0, rest::binary()>>, opts), do: parse(rest, opts)

  def parse(binary, opts) do
    cond do
      true == Grib1.detect(binary) -> Grib1.parse(binary, opts)
      true == Grib2.detect(binary) -> Grib2.parse(binary)
      true -> {:error, "No grib file detected"}
    end
  end
end
