defmodule ExGrib.Grib2.Section4.FixedSurfaceTypesAndUnits do
  @moduledoc """
  Table 4.5

  Fixed surface types and units

  Notes:

  1). The Eta vertical coordinate system involves normalizing the
    pressure at some point on a specific level by the mean sea level
    pressure at that point.

  2). Hybrid height level (Code figure 118) can be defined as:
    z(k)=A(k)+B(k)* orog
    (k=1,..., NLevels; orog=orography; z(k)=height in meters at level(k)

  3).  Hybrid pressure level, for which code figure 119 shall be used insteaf of 105,
    can be defined as:
    p(k)=A(k) + B(k) * sp
    (k=1,...,NLevels, sp=surface pressure; p(k)=pressure at level (k)

  4). Sigma height level is the vertical model level of the height-based terrain-following coordinate (Gal-Chen and
    Somerville, 1975). The value of the level = (height of the level – height of the terrain) /
    (height of the top level – height of the terrain), which is ≥ 0 and ≤ 1.

  5). The definition of a generalized vertical height coordinate implies the absence of
    coordinate values in section 4 but the presence of an external 3D-GRIB message that specifies
    the height of every model grid point in meters (see Notes for section 4), i.e., this GRIB message
    will contain the field with discipline = 0, category = 3, parameterm = 6 (Geometric height).

  6). The soil level represents a model level for which the depth is not constant across the model
    domain.The depth in metres of the level is provided by another GRIB message with the parameter
    "Soil Depth" with discipline 2, category 3 and parameter number 27.

  7). The level is defined by a water property difference from the near-surface to the level. The near-surface is typically
    chosen at 10 m depth. The physical quantity used to compute the difference can be water density (δΘ) when using
    level type 169 or water potential temperature (Θ) when using level type 170.

  https://www.nco.ncep.noaa.gov/pmb/docs/grib2/grib2_doc/grib2_table4-5.shtml
  """

  @type id :: integer()
  @type t ::
          :bottom_of_ocean_isothermal_layer
          | :bottom_of_ocean_mixed_layer
          | :bottom_of_root_zone
          | :bottom_of_sediment_layer
          | :bottom_of_sediment_layer_penetrated_by_thermal_wave
          | :bottom_of_thermally_active_sediment_layer
          | :bottom_surface
          | :boundary_layer_cloud_bottom_level
          | :boundary_layer_cloud_layer
          | :boundary_layer_cloud_top_level
          | :cloud_base_level
          | :cloud_ceiling
          | :convection_condensation_level
          | :convective_cloud_bottom_level
          | :convective_cloud_layer
          | :convective_cloud_top_level
          | :cumulonimbus_base
          | :cumulonimbus_top
          | :deep_convective_cloud_bottom_level
          | :deep_convective_cloud_top_level
          | :deep_inland_or_glacier_ice
          | :deep_soil
          | :depth_below_land_surface
          | :depth_below_sea_level
          | :depth_below_water_surface
          | :effective_layer
          | :effective_layer_bottom_level
          | :effective_layer_top_level
          | :entire_atmosphere
          | :entire_ocean
          | :equilibrium_level
          | :eta_level
          | :generalized_vertical_height_coordinate
          | :grid_scale_cloud_bottom_level
          | :grid_scale_cloud_top_level
          | :grid_tile_glacier_ice_and_inland_ice_fraction_as_a_model_surface
          | :grid_tile_ice_fraction_on_sea
          | :grid_tile_land_fraction_as_a_model_surface
          | :grid_tile_water_fraction_as_a_model_surface
          | :ground_or_water_surface
          | :high_cloud_bottom_level
          | :high_cloud_layer
          | :high_cloud_top_level
          | :highest_level_where_air_concentration_exceeds_the_specified_value
          | :highest_level_where_mass_density_exceeds_the_specified_value
          | :highest_level_where_radar_reflectivity_exceeds_the_specified_value
          | :highest_top_level_of_supercooled_liquid_water_layer
          | :highest_tropospheric_freezing_level
          | :hybrid_height_level
          | :hybrid_level
          | :hybrid_pressure_level
          | :isentropic
          | :isobaric_surface
          | :isothermal_level
          | :lake_or_river_bottom
          | :layer_between_two_depths_below_ocean_surface
          | :layer_between_two_hybrid_levels
          | :layer_ocean_surface_and
          | :level_at_specified_pressure_difference_from_ground_to_level
          | :level_of_adiabatic_condensation_lifted_from_the_surface
          | :level_of_0c_isotherm
          | :level_of_cloud_tops
          | :level_of_free_convection
          | :level_of_neutral_buoyancy_or_equilibrium
          | :logarithmic_hybrid_level
          | :low_cloud_bottom_level
          | :low_cloud_layer
          | :low_cloud_top_level
          | :lowest_bottom_level_of_supercooled_liquid_water_layer
          | :lowest_level_of_the_wet_bulb_zero
          | :lowest_level_where_air_concentration_exceeds_the_specified_value
          | :lowest_level_where_mass_density_exceeds_the_specified_value_base_for_a_given_threshold_of_mass_density
          | :lowest_level_where_vertically_integrated_cloud_cover_exceeds_the_specified_percentage_cloud_base_for_a_given_percentage_cloud_cover
          | :maximum_equivalent_potential_temperature_level
          | :maximum_wind_level
          | :mean_sea_level
          | :middle_cloud_bottom_level
          | :middle_cloud_layer
          | :middle_cloud_top_level
          | :mixed_layer_depth
          | :mixing_layer
          | :nominal_top_of_the_atmosphere
          | :ocean_isotherm_level
          | :ocean_level_defined_by_water_density_difference_from_near_surface_to_level
          | :ocean_level_defined_by_water_potential_temperature_difference_from_near_surface_to_level
          | :ocean_mixed_layer
          | :ocean_model_level
          | :ordered_sequence_of_data
          | :planetary_boundary_layer
          | :potential_vorticity_surface
          | :sea_bottom
          | :shallow_convective_cloud_bottom_level
          | :shallow_convective_cloud_top_level
          | :sigma_height_level
          | :sigma_level
          | :snow_level
          | :soil_level
          | :specific_altitude_above_mean_sea_level
          | :specified_height_level_above_ground
          | :top_surface_of_glacier_ice_and_inland_ice
          | :top_surface_of_ice
          | :top_surface_of_ice_on_sea
          | :tropopause
          | :reserved
          | :reserved_for_local_use
          | :missing

  @spec get(id()) :: t()
  def get(0), do: :reserved
  def get(1), do: :ground_or_water_surface
  def get(2), do: :cloud_base_level
  def get(3), do: :level_of_cloud_tops
  # Level of 0o C Isotherm
  def get(4), do: :level_of_0c_isotherm
  def get(5), do: :level_of_adiabatic_condensation_lifted_from_the_surface
  def get(6), do: :maximum_wind_level
  def get(7), do: :tropopause
  def get(8), do: :nominal_top_of_the_atmosphere
  def get(9), do: :sea_bottom
  def get(10), do: :entire_atmosphere
  # Cumulonimbus Base (CB)
  def get(11), do: :cumulonimbus_base
  # Cumulonimbus Top (CT)
  def get(12), do: :cumulonimbus_top

  def get(13),
    do:
      :lowest_level_where_vertically_integrated_cloud_cover_exceeds_the_specified_percentage_cloud_base_for_a_given_percentage_cloud_cover

  # Level of free convection (LFC)
  def get(14), do: :level_of_free_convection
  # Convection condensation level (CCL)
  def get(15), do: :convection_condensation_level
  # Level of neutral buoyancy or equilibrium (LNB)
  def get(16), do: :level_of_neutral_buoyancy_or_equilibrium
  def get(n) when n >= 17 and n <= 19, do: :reserved
  def get(20), do: :isothermal_level

  def get(21),
    do:
      :lowest_level_where_mass_density_exceeds_the_specified_value_base_for_a_given_threshold_of_mass_density

  # Highest level where mass density exceeds the specified value (top for a given threshold of mass density)
  def get(22), do: :highest_level_where_mass_density_exceeds_the_specified_value

  # Lowest level where air concentration exceeds the specified value (base for a given threshold of air concentration
  def get(23), do: :lowest_level_where_air_concentration_exceeds_the_specified_value

  # Highest level where air concentration exceeds the specified value (top for a given threshold of air concentration)
  def get(24), do: :highest_level_where_air_concentration_exceeds_the_specified_value

  # Highest level where radar reflectivity exceeds the specified value (echo top for a given threshold of reflectivity)
  def get(25), do: :highest_level_where_radar_reflectivity_exceeds_the_specified_value
  def get(n) when n >= 26 and n <= 99, do: :reserved
  def get(100), do: :isobaric_surface
  def get(101), do: :mean_sea_level
  def get(102), do: :specific_altitude_above_mean_sea_level
  def get(103), do: :specified_height_level_above_ground
  def get(104), do: :sigma_level
  def get(105), do: :hybrid_level
  def get(106), do: :depth_below_land_surface
  # Isentropic (theta) Level
  def get(107), do: :isentropic
  def get(108), do: :level_at_specified_pressure_difference_from_ground_to_level
  def get(109), do: :potential_vorticity_surface
  def get(110), do: :reserved
  def get(111), do: :eta_level
  def get(112), do: :reserved
  def get(113), do: :logarithmic_hybrid_level
  def get(114), do: :snow_level
  # Sigma height level (see Note 4)
  def get(115), do: :sigma_height_level
  def get(116), do: :reserved
  def get(117), do: :mixed_layer_depth
  def get(118), do: :hybrid_height_level
  def get(119), do: :hybrid_pressure_level
  def get(n) when n >= 120 and n <= 149, do: :reserved
  # Generalized Vertical Height Coordinate (see Note 4)
  def get(150), do: :generalized_vertical_height_coordinate
  # Soil level (See Note 5)
  def get(151), do: :soil_level
  def get(n) when n >= 152 and n <= 159, do: :reserved
  def get(160), do: :depth_below_sea_level
  def get(161), do: :depth_below_water_surface
  def get(162), do: :lake_or_river_bottom
  def get(163), do: :bottom_of_sediment_layer
  def get(164), do: :bottom_of_thermally_active_sediment_layer
  def get(165), do: :bottom_of_sediment_layer_penetrated_by_thermal_wave
  def get(166), do: :mixing_layer
  def get(167), do: :bottom_of_root_zone
  def get(168), do: :ocean_model_level

  # Ocean level defined by water density (sigma-theta) difference from near-surface to level (see Note 7)
  def get(169), do: :ocean_level_defined_by_water_density_difference_from_near_surface_to_level

  # Ocean level defined by water potential temperature difference from near-surface to level (see Note 7)
  def get(170),
    do: :ocean_level_defined_by_water_potential_temperature_difference_from_near_surface_to_level

  def get(n) when n >= 171 and n <= 173, do: :reserved
  # Top Surface of Ice on Sea, Lake or River
  def get(174), do: :top_surface_of_ice_on_sea
  # Top Surface of Ice, under Snow, on Sea, Lake or River
  def get(175), do: :top_surface_of_ice
  # Bottom Surface (underside) Ice on Sea, Lake or River
  def get(176), do: :bottom_surface
  # Deep Soil (of indefinite depth)
  def get(177), do: :deep_soil
  def get(178), do: :reserved
  def get(179), do: :top_surface_of_glacier_ice_and_inland_ice
  # Deep Inland or Glacier Ice (of indefinite depth)
  def get(180), do: :deep_inland_or_glacier_ice
  def get(181), do: :grid_tile_land_fraction_as_a_model_surface
  def get(182), do: :grid_tile_water_fraction_as_a_model_surface
  # Grid Tile Ice Fraction on Sea, Lake or River as a Model Surface
  def get(183), do: :grid_tile_ice_fraction_on_sea
  def get(184), do: :grid_tile_glacier_ice_and_inland_ice_fraction_as_a_model_surface
  def get(n) when n >= 185 and n <= 191, do: :reserved
  def get(n) when n >= 192 and n <= 254, do: :reserved_for_local_use
  # Entire atmosphere (considered as a single layer)
  def get(200), do: :entire_atmosphere
  # Entire ocean (considered as a single layer)
  def get(201), do: :entire_ocean
  def get(204), do: :highest_tropospheric_freezing_level
  def get(206), do: :grid_scale_cloud_bottom_level
  def get(207), do: :grid_scale_cloud_top_level
  def get(209), do: :boundary_layer_cloud_bottom_level
  def get(210), do: :boundary_layer_cloud_top_level
  def get(211), do: :boundary_layer_cloud_layer
  def get(212), do: :low_cloud_bottom_level
  def get(213), do: :low_cloud_top_level
  def get(214), do: :low_cloud_layer
  def get(215), do: :cloud_ceiling
  def get(216), do: :effective_layer_top_level
  def get(217), do: :effective_layer_bottom_level
  def get(218), do: :effective_layer
  def get(220), do: :planetary_boundary_layer
  def get(221), do: :layer_between_two_hybrid_levels
  def get(222), do: :middle_cloud_bottom_level
  def get(223), do: :middle_cloud_top_level
  def get(224), do: :middle_cloud_layer
  def get(232), do: :high_cloud_bottom_level
  def get(233), do: :high_cloud_top_level
  def get(234), do: :high_cloud_layer
  # Ocean Isotherm Level (1/10 ° C)
  def get(235), do: :ocean_isotherm_level
  def get(236), do: :layer_between_two_depths_below_ocean_surface
  # Bottom of Ocean Mixed Layer (m)
  def get(237), do: :bottom_of_ocean_mixed_layer
  # Bottom of Ocean Isothermal Layer (m)
  def get(238), do: :bottom_of_ocean_isothermal_layer
  # Layer Ocean Surface and 26C Ocean Isothermal Level
  def get(239), do: :layer_ocean_surface_and
  def get(240), do: :ocean_mixed_layer
  def get(241), do: :ordered_sequence_of_data
  def get(242), do: :convective_cloud_bottom_level
  def get(243), do: :convective_cloud_top_level
  def get(244), do: :convective_cloud_layer
  def get(245), do: :lowest_level_of_the_wet_bulb_zero
  def get(246), do: :maximum_equivalent_potential_temperature_level
  def get(247), do: :equilibrium_level
  def get(248), do: :shallow_convective_cloud_bottom_level
  def get(249), do: :shallow_convective_cloud_top_level
  def get(251), do: :deep_convective_cloud_bottom_level
  def get(252), do: :deep_convective_cloud_top_level
  def get(253), do: :lowest_bottom_level_of_supercooled_liquid_water_layer
  def get(254), do: :highest_top_level_of_supercooled_liquid_water_layer
  def get(255), do: :missing
end
