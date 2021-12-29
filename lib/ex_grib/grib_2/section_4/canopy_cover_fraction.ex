defmodule ExGrib.Grib2.Section4.CanopyCoverFraction do
  @moduledoc """
  Table 4.234

  Canopy cover fraction (to be used as partitioned parameter in pdt 4.53 or 4.54)

  https://www.nco.ncep.noaa.gov/pmb/docs/grib2/grib2_doc/grib2_table4-234.shtml
  """

  @type id :: integer()
  @type t ::
          :bogs_and_marshes
          | :crops
          | :deciduous_broadleaf_trees
          | :deciduous_needleleaf_trees
          | :deciduous_shrubs
          | :desert
          | :evergreen_broadleaf_trees
          | :evergreen_needleleaf_trees
          | :evergreen_shrubs
          | :ice_caps_and_glaciers
          | :inland_water
          | :interrupted_forest
          | :irrigated_corps
          | :mixed_forest
          | :ocean
          | :semidesert
          | :short_grass
          | :tall_grass
          | :tundra
          | :water_and_land_mixtures
          | :reserved
          | :reserved_for_local_use
          | :missing

  @spec get(id()) :: t()
  # Crops, mixed farming
  def get(1), do: :crops
  def get(2), do: :short_grass
  def get(3), do: :evergreen_needleleaf_trees
  def get(4), do: :deciduous_needleleaf_trees
  def get(5), do: :deciduous_broadleaf_trees
  def get(6), do: :evergreen_broadleaf_trees
  def get(7), do: :tall_grass
  def get(8), do: :desert
  def get(9), do: :tundra
  def get(10), do: :irrigated_corps
  def get(11), do: :semidesert
  def get(12), do: :ice_caps_and_glaciers
  def get(13), do: :bogs_and_marshes
  def get(14), do: :inland_water
  def get(15), do: :ocean
  def get(16), do: :evergreen_shrubs
  def get(17), do: :deciduous_shrubs
  def get(18), do: :mixed_forest
  def get(19), do: :interrupted_forest
  def get(20), do: :water_and_land_mixtures
  def get(n) when n >= 21 and n <= 191, do: :reserved
  def get(n) when n >= 192 and n <= 254, do: :reserved_for_local_use
  def get(255), do: :missing
end
