defmodule ExGrib.Grib2.Section3.NumberingOrderOfDiamonds do
  @moduledoc """
  Table 3.9

  Numbering order of diamonds as seen from the corresponding pole.

  https://www.nco.ncep.noaa.gov/pmb/docs/grib2/grib2_doc/grib2_table3-9.shtml
  """

  @type input :: binary()
  @type t :: :clockwise | :anti_clockwise | :error

  @spec get(input()) :: t()
  def get(<<0::integer-size(1), _::bits-size(7)>>), do: :clockwise
  def get(<<1::integer-size(1), _::bits-size(7)>>), do: :anti_clockwise
  def get(_), do: :error
end
