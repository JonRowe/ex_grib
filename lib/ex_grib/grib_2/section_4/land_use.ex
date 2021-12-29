defmodule ExGrib.Grib2.Section4.LandUse do
  @moduledoc """
  Table 4.212

  Land use

  https://www.nco.ncep.noaa.gov/pmb/docs/grib2/grib2_doc/grib2_table4-212.shtml
  """

  @type id :: integer()
  @type t ::
          :agricultural
          | :coniferous_forest
          | :deciduous_forest
          | :desert
          | :forest
          | :ice
          | :range_land
          | :savannah
          | :tropical_forest
          | :tundra
          | :urban_land
          | :water
          | :wetlands
          | :reserved
          | :reserved_for_local_use
          | :missing

  @spec get(id()) :: t()
  def get(0), do: :reserved
  def get(1), do: :urban_land
  def get(2), do: :agricultural
  def get(3), do: :range_land
  def get(4), do: :deciduous_forest
  def get(5), do: :coniferous_forest
  # Forest/Wetland
  def get(6), do: :forest
  def get(7), do: :water
  def get(8), do: :wetlands
  def get(9), do: :desert
  def get(10), do: :tundra
  def get(11), do: :ice
  def get(12), do: :tropical_forest
  def get(13), do: :savannah
  def get(n) when n >= 14 and n <= 191, do: :reserved
  def get(n) when n >= 192 and n <= 254, do: :reserved_for_local_use
  def get(255), do: :missing
end
