defmodule ExGrib.Grib2.Section4.PixelSceneType do
  @moduledoc """
  Table 4.218

  Pixel scene type

  https://www.nco.ncep.noaa.gov/pmb/docs/grib2/grib2_doc/grib2_table4-218.shtml
  """

  @type id :: integer()
  @type t ::
          :barren_desert
          | :closed_shrub_land
          | :cropland
          | :deciduous_broad_leafed_forest
          | :deciduous_mixed_forest
          | :deciduous_needle_leafed_forest
          | :general_cloud
          | :grassland
          | :green_broad_leafed_forest
          | :green_needle_leafed_forest
          | :high_cloud
          | :low_cloud
          | :medium_cloud
          | :mixed_phase_cloud
          | :multi_layeblack_cloud
          | :no_scene_identified
          | :open_shrub_land
          | :optically_thick_ice_cloud
          | :optically_thin_ice_cloud
          | :permanent_snow
          | :permanent_wetland
          | :savannah
          | :single_layer_ice_cloud
          | :single_layer_water_cloud
          | :snow
          | :sun_glint
          | :supercooled_liquid_water_cloud
          | :tundra
          | :unknown_cloud_type
          | :urban
          | :vegetation
          | :warm_liquid_water_cloud
          | :water_bodies
          | :woody_savannah
          | :reserved
          | :reserved_for_local_use
          | :missing

  @spec get(id()) :: t()
  def get(0), do: :no_scene_identified
  def get(1), do: :green_needle_leafed_forest
  def get(2), do: :green_broad_leafed_forest
  def get(3), do: :deciduous_needle_leafed_forest
  def get(4), do: :deciduous_broad_leafed_forest
  def get(5), do: :deciduous_mixed_forest
  def get(6), do: :closed_shrub_land
  def get(7), do: :open_shrub_land
  def get(8), do: :woody_savannah
  def get(9), do: :savannah
  def get(10), do: :grassland
  def get(11), do: :permanent_wetland
  def get(12), do: :cropland
  def get(13), do: :urban
  # Vegetation / Crops
  def get(14), do: :vegetation
  # Permanent Snow / Ice
  def get(15), do: :permanent_snow
  def get(16), do: :barren_desert
  def get(17), do: :water_bodies
  def get(18), do: :tundra
  def get(19), do: :warm_liquid_water_cloud
  def get(20), do: :supercooled_liquid_water_cloud
  def get(21), do: :mixed_phase_cloud
  def get(22), do: :optically_thin_ice_cloud
  def get(23), do: :optically_thick_ice_cloud
  def get(24), do: :multi_layeblack_cloud
  def get(n) when n >= 25 and n <= 96, do: :reserved
  # Snow / Ice on Land
  def get(97), do: :snow
  # Snow / Ice on Water
  def get(98), do: :snow
  def get(99), do: :sun_glint
  def get(100), do: :general_cloud
  # Low Cloud / Fog / Stratus
  def get(101), do: :low_cloud
  # Low Cloud / Stratocumulus
  def get(102), do: :low_cloud
  # Low Cloud / Unknown Type
  def get(103), do: :low_cloud
  # Medium Cloud / Nimbostratus
  def get(104), do: :medium_cloud
  # Medium Cloud / Altostratus
  def get(105), do: :medium_cloud
  # Medium Cloud / Unknown Type
  def get(106), do: :medium_cloud
  # High Cloud / Cumulus
  def get(107), do: :high_cloud
  # High Cloud / Cirrus
  def get(108), do: :high_cloud
  # High Cloud / Unknown Type
  def get(109), do: :high_cloud
  def get(110), do: :unknown_cloud_type
  def get(111), do: :single_layer_water_cloud
  def get(112), do: :single_layer_ice_cloud
  def get(n) when n >= 113 and n <= 191, do: :reserved
  def get(n) when n >= 192 and n <= 254, do: :reserved_for_local_use
  def get(255), do: :missing
end
