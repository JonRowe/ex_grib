defmodule ExGrib.Grib2.Section3.VerticalDimensionCoordinateValues do
  @moduledoc """
  Table 3.21

  https://www.nco.ncep.noaa.gov/pmb/docs/grib2/grib2_doc/grib2_table3-21.shtml
  """

  @type input :: integer()
  @type t :: :explicit | :linear | :geometric | :reserved | :reserved_for_local_use | :missing

  @spec get(input()) :: t()
  def get(0), do: :explicit
  def get(1), do: :linear
  def get(n) when n >= 2 and n <= 10, do: :reserved
  def get(11), do: :geometric
  def get(n) when n >= 12 and n <= 191, do: :reserved
  def get(n) when n >= 192 and n <= 254, do: :reserved_for_local_use
  def get(255), do: :missing
end
