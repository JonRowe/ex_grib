defmodule ExGrib.Grib2.Section4.SoilType do
  @moduledoc """
  Table 4.213

  Soil type

  https://www.nco.ncep.noaa.gov/pmb/docs/grib2/grib2_doc/grib2_table4-213.shtml
  """

  @type id :: integer()
  @type t ::
          :clay
          | :clay_loam
          | :loamy_sand
          | :organic
          | :sand
          | :sandy_clay
          | :sandy_clay_loam
          | :sandy_loam
          | :silt_clay_loam
          | :silt_loam
          | :silty_clay
          | :reserved
          | :reserved_for_local_use
          | :missing

  @spec get(id()) :: t()
  def get(0), do: :reserved
  def get(1), do: :sand
  def get(2), do: :loamy_sand
  def get(3), do: :sandy_loam
  def get(4), do: :silt_loam
  def get(5), do: :organic
  def get(6), do: :sandy_clay_loam
  def get(7), do: :silt_clay_loam
  def get(8), do: :clay_loam
  def get(9), do: :sandy_clay
  def get(10), do: :silty_clay
  def get(11), do: :clay
  def get(n) when n >= 12 and n <= 191, do: :reserved
  def get(n) when n >= 192 and n <= 254, do: :reserved_for_local_use
  def get(255), do: :missing
end
