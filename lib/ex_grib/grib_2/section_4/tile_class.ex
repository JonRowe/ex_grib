defmodule ExGrib.Grib2.Section4.TileClass do
  @moduledoc """
  Table 4.243

  Tile class

  https://www.nco.ncep.noaa.gov/pmb/docs/grib2/grib2_doc/grib2_table4-243.shtml
  """

  @type id :: integer()
  @type t ::
          :artificial_surface
          | :bare_areas
          | :burnt_tree_cover
          | :closed_broadleaved_evergreen_forest
          | :closed_forest_or_shrubland_permanently_flooded
          | :closed_needle_leaved_evergreen_forest
          | :closed_to_open_forest_regularly_flooded
          | :closed_to_open_grassland_regularly_flooded
          | :closed_to_open_shrubland
          | :cultivated_and_managed_areas
          | :deciduous_broadleaved_closed_forest
          | :deciduous_broadleaved_open_forest
          | :deciduous_needle_leaf_forest
          | :deciduous_shurbs_closed_open
          | :evergreen_broadleaved_forest
          | :evergreen_needle_leaf_forest
          | :evergreen_shurbs_closed_open
          | :flooded_shurbs_or_herbaceous
          | :fresh_water_flooded_trees
          | :herbaceous_vegetation_closed_open
          | :irrigated_croplands
          | :mixed_broadleaved_and_needle_leave_forest
          | :mixed_leaf_trees
          | :mosaic_crop
          | :mosaic_cropland
          | :mosaic_grassland
          | :mosaic_shrubland
          | :mosaic_tree
          | :mosaic_vegetation
          | :ocean
          | :open_needle_leaved_deciduous_forest
          | :rain_fed_croplands
          | :saline_water_flooded_trees
          | :snow_and_ice
          | :sparse_herbaceous_or_grass
          | :sparse_vegetation
          | :undefined
          | :water
          | :reserved
          | :reserved_for_local_use
          | :missing

  @spec get(id()) :: t()
  def get(0), do: :reserved
  def get(1), do: :evergreen_broadleaved_forest
  def get(2), do: :deciduous_broadleaved_closed_forest
  def get(3), do: :deciduous_broadleaved_open_forest
  def get(4), do: :evergreen_needle_leaf_forest
  def get(5), do: :deciduous_needle_leaf_forest
  def get(6), do: :mixed_leaf_trees
  def get(7), do: :fresh_water_flooded_trees
  def get(8), do: :saline_water_flooded_trees
  # Mosaic tree/natural vegetation
  def get(9), do: :mosaic_tree
  def get(10), do: :burnt_tree_cover
  def get(11), do: :evergreen_shurbs_closed_open
  def get(12), do: :deciduous_shurbs_closed_open
  def get(13), do: :herbaceous_vegetation_closed_open
  def get(14), do: :sparse_herbaceous_or_grass
  def get(15), do: :flooded_shurbs_or_herbaceous
  def get(16), do: :cultivated_and_managed_areas
  # Mosaic crop/tree/natural vegetation
  def get(17), do: :mosaic_crop
  # Mosaic crop/shrub/grass
  def get(18), do: :mosaic_crop
  def get(19), do: :bare_areas
  def get(20), do: :water
  def get(21), do: :snow_and_ice
  def get(22), do: :artificial_surface
  def get(23), do: :ocean
  def get(24), do: :irrigated_croplands
  def get(25), do: :rain_fed_croplands
  # Mosaic cropland (50-70%)-vegetation (20-50%)
  def get(26), do: :mosaic_cropland
  # Mosaic vegetation (50-70%)-cropland (20-50%)
  def get(27), do: :mosaic_vegetation
  def get(28), do: :closed_broadleaved_evergreen_forest
  def get(29), do: :closed_needle_leaved_evergreen_forest
  def get(30), do: :open_needle_leaved_deciduous_forest
  def get(31), do: :mixed_broadleaved_and_needle_leave_forest
  # Mosaic shrubland (50-70%)-grassland (20-50%)
  def get(32), do: :mosaic_shrubland
  # Mosaic grassland (50-70%)-shrubland (20-50%)
  def get(33), do: :mosaic_grassland
  def get(34), do: :closed_to_open_shrubland
  def get(35), do: :sparse_vegetation
  def get(36), do: :closed_to_open_forest_regularly_flooded
  def get(37), do: :closed_forest_or_shrubland_permanently_flooded
  def get(38), do: :closed_to_open_grassland_regularly_flooded
  def get(39), do: :undefined
  def get(n) when n >= 40 and n <= 191, do: :reserved
  def get(n) when n >= 192 and n <= 254, do: :reserved_for_local_use
  def get(255), do: :missing
end
