defmodule ExGrib.Grib1.Section5 do
  @moduledoc """
  Section 5

  End section

  https://apps.ecmwf.int/codes/grib/format/grib1/sections/5/
  """

  @type input :: binary()
  @type t :: {:ok, :end_of_file} | {:ok, :more_data, binary()} | :error

  @spec parse(input()) :: t()
  # "7777" - Coded according to the International Alphabet Number 5.
  def parse(<<"7777">>), do: {:ok, :end_of_file}
  def parse(<<"7777", rest::binary()>>), do: {:ok, :more_data, rest}
  def parse(_), do: :error
end
