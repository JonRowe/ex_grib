defmodule ExGrib.Grib2.Section8 do
  @moduledoc """
  Section 8

  End section

  https://www.nco.ncep.noaa.gov/pmb/docs/grib2/grib2_doc/grib2_sect8.shtml
  """

  @type input :: binary()
  @type t :: {:ok, :end_of_file} | {:ok, :more_data, binary()} | :error

  @spec parse(input()) :: t()
  # "7777" - Coded according to the International Alphabet Number 5.
  def parse(<<"7777">>), do: {:ok, :end_of_file}
  def parse(<<"7777", rest::binary()>>), do: {:ok, :more_data, rest}
  def parse(_), do: :error
end
