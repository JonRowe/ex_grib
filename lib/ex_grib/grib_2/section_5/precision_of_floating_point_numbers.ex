defmodule ExGrib.Grib2.Section5.PrecisionOfFloatingPointNumbers do
  @moduledoc """
  Table 5.7

  Precision of floating point numbers

  https://www.nco.ncep.noaa.gov/pmb/docs/grib2/grib2_doc/grib2_table5-7.shtml
  """

  @type id :: integer()
  @type t ::
          :ieee
          | :ieee_32
          | :ieee_64
          | :ieee_128
          | :reserved
          | :missing

  @spec get(id()) :: t()
  def get(0), do: :reserved
  # IEEE 32-bit (I=4 in Section 7)
  def get(1), do: :ieee_32
  # IEEE 64-bit (I=8 in Section 7)
  def get(2), do: :ieee_64
  # IEEE 128-bit (I=16 in Section 7)
  def get(3), do: :ieee_128
  def get(n) when n >= 4 and n <= 254, do: :reserved
  def get(255), do: :missing
end
