defmodule ExGrib.Grib1.Table3 do
  @moduledoc """
  Fixed levels or layers for which the data are included

  Notes:

  - 1 For reserved values, or if not defined, octets 11 and 12 shall contain zero.

  - 2 The ETA vertical coordinate system involves normalizing the pressure at some
      point on a specific level by the mean sea level pressure at that point.

  https://apps.ecmwf.int/codes/grib/format/grib1/level/3/
  """

  @type id :: integer()

  @type octet_10 ::
          :cloud_base_level
          | :depth_below_land_surface
          | :depth_below_sea_level
          | :entire_atmosphere
          | :entire_ocean
          | :eta_level
          | :ground_or_water_surface
          | :hybrid_level
          | :isentropic_level
          | :isobaric_surface
          | :isobaric_surface_high_precision_ecmwf_extension
          | :isothermal_level
          | :layer_between_two_depths_below_land
          | :layer_between_two_eta_levels
          | :layer_between_two_hybrid_levels
          | :layer_between_two_isentropic_levels
          | :layer_between_two_isobaric_surfaces
          | :layer_between_two_isobaric_surfaces_high_precision
          | :layer_between_two_isobaric_surfaces_mixed_precision
          | :layer_between_two_levels_at_specified_pressure_differences_from_ground_to_level
          | :layer_between_two_sigma_levels
          | :layer_between_two_sigma_levels_high_precision
          | :layer_between_two_specified_altitudes
          | :layer_between_two_specified_height_levels
          | :level_at_specified_pressure_difference
          | :level_of_0c_isotherm
          | :level_of_adiabatic_condensation_lifted_from_the_surface
          | :level_of_cloud_tops
          | :maximum_wind_level
          | :mean_sea_level
          | :nominal_top_of_atmosphere
          | :potential_vorticity_surface
          | :satellite_spectral_band
          | :sea_bottom
          | :sigma_level
          | :specified_altitude_above_mean_sea_level
          | :specified_height_level_above_ground
          | :specified_height_level_above_ground_high_precision
          | :tropopause

  @type octet_11 ::
          :altitude_in_metres
          | :altitude_of_top_in_hm
          | :continue
          | :depth_in_centimetres
          | :depth_in_metres
          | :depth_of_upper_surface_in_cm
          | :eta_value_at_top_of_layer_in_1_over_100
          | :eta_value_in_1_over_10000
          | :four_hundred_seventy_five_k_minus_theta_of_top_in_k
          | :height_in_centimetres
          | :height_in_metres
          | :height_of_top_in_hm
          | :level_number
          | :level_number_of_top
          | :not_set
          | :one_hundred_and_nine_k_m2_kg1_s1
          | :one_point_one_minus_sigma_of_top
          | :one_thousand_one_hundred_hpa_minus_pressure_of_top_in_hpa
          | :potential_temperature_in_k
          | :pressure_difference_from_ground_to_top_level_in_hpa
          | :pressure_difference_in_hpa_from_ground_to_level
          | :pressure_in_hpa
          | :pressure_in_pa
          | :pressure_of_top_in_kpa
          | :pressure_of_top_in_kpa
          | :sigma_value_in_1_over_10000
          | :sigma_value_of_top_in_1_over_100
          | :temperature_in_1_over_100_k

  @type octet_12 ::
          :altitude_of_bottom_in_hm_above_mean_sea_level
          | :continue
          | :depth_of_lower_surface_surface_in_cm
          | :eta_value_at_bottom_of_layer_in_1_over_100
          | :four_hundred_seventy_five_k_minus_theta_of_bottom_in_k
          | :height_of_bottom_in_hm_above_ground
          | :level_number_of_bottom
          | :not_set
          | :one_point_one_minus_sigma_of_bottom
          | :one_thousand_one_hundred_hpa_minus_pressure_of_bottom_in_hpa
          | :one_thousand_one_hundred_hpa_minus_pressure_of_bottom_in_hpa
          | :pressure_difference_from_ground_to_bottom_level_in_hpa
          | :pressure_of_bottom_in_kpa
          | :sigma_value_of_bottom_in_1_over_100

  @type t :: %__MODULE__{octet_10: octet_10, octet_11: octet_11, octet_12: octet_12} | :reserved

  defstruct octet_10: :not_parsed, octet_11: :not_parsed, octet_12: :not_parsed

  @spec get(id()) :: t()
  def get(0), do: :reserved

  def get(1),
    do: %__MODULE__{octet_10: :ground_or_water_surface, octet_11: :not_set, octet_12: :not_set}

  def get(2), do: %__MODULE__{octet_10: :cloud_base_level, octet_11: :not_set, octet_12: :not_set}

  def get(3),
    do: %__MODULE__{octet_10: :level_of_cloud_tops, octet_11: :not_set, octet_12: :not_set}

  def get(4),
    do: %__MODULE__{octet_10: :level_of_0c_isotherm, octet_11: :not_set, octet_12: :not_set}

  def get(5),
    do: %__MODULE__{
      octet_10: :level_of_adiabatic_condensation_lifted_from_the_surface,
      octet_11: :not_set,
      octet_12: :not_set
    }

  def get(6),
    do: %__MODULE__{octet_10: :maximum_wind_level, octet_11: :not_set, octet_12: :not_set}

  def get(7), do: %__MODULE__{octet_10: :tropopause, octet_11: :not_set, octet_12: :not_set}

  def get(8),
    do: %__MODULE__{octet_10: :nominal_top_of_atmosphere, octet_11: :not_set, octet_12: :not_set}

  def get(9), do: %__MODULE__{octet_10: :sea_bottom, octet_11: :not_set, octet_12: :not_set}
  def get(n) when n >= 10 and n <= 19, do: :reserved

  def get(100),
    do: %__MODULE__{
      octet_10: :isobaric_surface,
      octet_11: :pressure_in_hpa,
      octet_12: :continue
    }

  def get(101),
    do: %__MODULE__{
      octet_10: :layer_between_two_isobaric_surfaces,
      octet_11: :pressure_of_top_in_kpa,
      octet_12: :pressure_of_bottom_in_kpa
    }

  def get(102), do: %__MODULE__{octet_10: :mean_sea_level, octet_11: :not_set, octet_12: :not_set}

  def get(103),
    do: %__MODULE__{
      octet_10: :specified_altitude_above_mean_sea_level,
      octet_11: :altitude_in_metres,
      octet_12: :continue
    }

  def get(104),
    do: %__MODULE__{
      octet_10: :layer_between_two_specified_altitudes,
      octet_11: :altitude_of_top_in_hm,
      octet_12: :altitude_of_bottom_in_hm_above_mean_sea_level
    }

  def get(105),
    do: %__MODULE__{
      octet_10: :specified_height_level_above_ground,
      octet_11: :height_in_metres,
      octet_12: :continue
    }

  def get(106),
    do: %__MODULE__{
      octet_10: :layer_between_two_specified_height_levels,
      octet_11: :height_of_top_in_hm,
      octet_12: :height_of_bottom_in_hm_above_ground
    }

  def get(107),
    do: %__MODULE__{
      octet_10: :sigma_level,
      octet_11: :sigma_value_in_1_over_10000,
      octet_12: :continue
    }

  def get(108),
    do: %__MODULE__{
      octet_10: :layer_between_two_sigma_levels,
      octet_11: :sigma_value_of_top_in_1_over_100,
      octet_12: :sigma_value_of_bottom_in_1_over_100
    }

  def get(109),
    do: %__MODULE__{
      octet_10: :hybrid_level,
      octet_11: :level_number,
      octet_12: :continue
    }

  def get(110),
    do: %__MODULE__{
      octet_10: :layer_between_two_hybrid_levels,
      octet_11: :level_number_of_top,
      octet_12: :level_number_of_bottom
    }

  def get(111),
    do: %__MODULE__{
      octet_10: :depth_below_land_surface,
      octet_11: :depth_in_centimetres,
      octet_12: :continue
    }

  def get(112),
    do: %__MODULE__{
      octet_10: :layer_between_two_depths_below_land,
      octet_11: :depth_of_upper_surface_in_cm,
      octet_12: :depth_of_lower_surface_surface_in_cm
    }

  def get(113),
    do: %__MODULE__{
      octet_10: :isentropic_level,
      octet_11: :potential_temperature_in_k,
      octet_12: :continue
    }

  def get(114),
    do: %__MODULE__{
      octet_10: :layer_between_two_isentropic_levels,
      octet_11: :four_hundred_seventy_five_k_minus_theta_of_top_in_k,
      octet_12: :four_hundred_seventy_five_k_minus_theta_of_bottom_in_k
    }

  def get(115),
    do: %__MODULE__{
      octet_10: :level_at_specified_pressure_difference,
      octet_11: :pressure_difference_in_hpa_from_ground_to_level,
      octet_12: :continue
    }

  def get(116),
    do: %__MODULE__{
      octet_10: :layer_between_two_levels_at_specified_pressure_differences_from_ground_to_level,
      octet_11: :pressure_difference_from_ground_to_top_level_in_hpa,
      octet_12: :pressure_difference_from_ground_to_bottom_level_in_hpa
    }

  def get(117),
    do: %__MODULE__{
      octet_10: :potential_vorticity_surface,
      octet_11: :one_hundred_and_nine_k_m2_kg1_s1,
      octet_12: :not_set
    }

  def get(118), do: :reserved

  def get(119),
    do: %__MODULE__{
      octet_10: :eta_level,
      octet_11: :eta_value_in_1_over_10000,
      octet_12: :continue
    }

  def get(120),
    do: %__MODULE__{
      octet_10: :layer_between_two_eta_levels,
      octet_11: :eta_value_at_top_of_layer_in_1_over_100,
      octet_12: :eta_value_at_bottom_of_layer_in_1_over_100
    }

  def get(121),
    do: %__MODULE__{
      octet_10: :layer_between_two_isobaric_surfaces_high_precision,
      octet_11: :one_thousand_one_hundred_hpa_minus_pressure_of_top_in_hpa,
      octet_12: :one_thousand_one_hundred_hpa_minus_pressure_of_bottom_in_hpa
    }

  def get(n) when n >= 122 and n <= 124, do: :reserved

  def get(125),
    do: %__MODULE__{
      octet_10: :specified_height_level_above_ground_high_precision,
      octet_11: :height_in_centimetres,
      octet_12: :continue
    }

  def get(126), do: :reserved

  def get(127),
    do: %__MODULE__{
      octet_10: :satellite_spectral_band,
      octet_11: :continue,
      octet_12: :not_set
    }

  def get(128),
    do: %__MODULE__{
      octet_10: :layer_between_two_sigma_levels_high_precision,
      octet_11: :one_point_one_minus_sigma_of_top,
      octet_12: :one_point_one_minus_sigma_of_bottom
    }

  def get(n) when n >= 129 and n <= 140, do: :reserved

  def get(141),
    do: %__MODULE__{
      octet_10: :layer_between_two_isobaric_surfaces_mixed_precision,
      octet_11: :pressure_of_top_in_kpa,
      octet_12: :one_thousand_one_hundred_hpa_minus_pressure_of_bottom_in_hpa
    }

  def get(n) when n >= 142 and n <= 159, do: :reserved

  def get(160),
    do: %__MODULE__{
      octet_10: :depth_below_sea_level,
      octet_11: :depth_in_metres,
      octet_12: :continue
    }

  def get(n) when n >= 161 and n <= 199, do: :reserved

  def get(20),
    do: %__MODULE__{
      octet_10: :isothermal_level,
      octet_11: :temperature_in_1_over_100_k,
      octet_12: :not_set
    }

  def get(200),
    do: %__MODULE__{octet_10: :entire_atmosphere, octet_11: :not_set, octet_12: :not_set}

  def get(201), do: %__MODULE__{octet_10: :entire_ocean, octet_11: :not_set, octet_12: :not_set}
  def get(n) when n >= 202 and n <= 209, do: :reserved
  def get(n) when n >= 21 and n <= 99, do: :reserved

  def get(210),
    do: %__MODULE__{
      octet_10: :isobaric_surface_high_precision_ecmwf_extension,
      octet_11: :pressure_in_pa,
      octet_12: :continue
    }

  def get(n) when n >= 211 and n <= 254, do: :reserved
end
