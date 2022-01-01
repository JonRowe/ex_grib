defmodule ExGrib.Grib2.Section4.ProductDefinitionTemplateNumber do
  @moduledoc """
  Table 4.0

  Product definition template number

  https://www.nco.ncep.noaa.gov/pmb/docs/grib2/grib2_doc/grib2_table4-0.shtml
  """

  @type id :: integer()
  @type t ::
          :analysis_or_forecast
          | :analysis_or_forecast_error
          | :analysis_or_forecast_for_aerosol
          | :analysis_or_forecast_for_atmospheric_chemical_constituents
          | :analysis_or_forecast_for_atmospheric_chemical_constituents_based_on_a_distribution_function
          | :analysis_or_forecast_for_simulate
          | :average_accumulation_at_intervals_for_aerosol
          | :average_accumulation_at_intervals_for_atmospheric_chemical_constituents
          | :average_accumulation_at_intervals_for_atmospheric_chemical_constituents_based_on_a_distribution_function
          | :average_accumulation_at_intervals_for_spatio_temporal_changing_tiles
          | :average_accumulation_extreme_values_at_intervals
          | :average_accumulation_extreme_values_or_other_statistically_processed_values_over_a_spatial_area
          | :categorical_forecast
          | :categorical_forecast_at_intervals
          | :ccitt_ia
          | :cross_section_of_analysis_and_forecast_at_a_point_in_time
          | :cross_section_of_analysis_and_forecast_averaged_or_otherwise_statistically_processed_over_latitude_or_longitude
          | :cross_section_of_averaged_or_otherwise_statistically_processed_analysis_or_forecast_over_a_range_of_time
          | :derived_forecasts_based_on_a_cluster_of_ensemble_members_over_a_circular_area
          | :derived_forecasts_based_on_a_cluster_of_ensemble_members_over_a_circular_area_at_intervals
          | :derived_forecasts_based_on_a_cluster_of_ensemble_members_over_a_rectangular_area
          | :derived_forecasts_based_on_a_cluster_of_ensemble_members_over_a_rectangular_area_at_intervals
          | :derived_forecasts_based_on_all_ensemble_members
          | :derived_forecasts_based_on_all_ensemble_members_at_intervals
          | :hovmoller_type_grid_with_averaging_or_other_statistical_processing
          | :hovmoller_type_grid_with_no_averaging_or_other_statistical_processing
          | :individual_ensemble_forecast_control_and_perturbed
          | :individual_ensemble_forecast_control_and_perturbed_at_intervals
          | :individual_ensemble_forecast_control_and_perturbed_at_intervals_for_aerosol
          | :individual_ensemble_forecast_control_and_perturbed_at_intervals_for_atmospheric_chemical_constituents
          | :individual_ensemble_forecast_control_and_perturbed_at_intervals_for_atmospheric_chemical_constituents_based_on_a_distribution_function
          | :individual_ensemble_forecast_control_and_perturbed_at_intervals_for_simulated
          | :individual_ensemble_forecast_control_and_perturbed_at_intervals_for_spatio_temporal_changing_tiles
          | :individual_ensemble_forecast_control_and_perturbed_for_atmospheric_chemical_constituents
          | :individual_ensemble_forecast_control_and_perturbed_for_optical_properties_of_aerosol
          | :individual_ensemble_forecast_control_and_perturbed_for_partitioned_parameters
          | :individual_ensemble_forecast_control_and_perturbed_for_simulated
          | :individual_ensemble_forecast_control_and_perturbed_for_spatio_temporal_changing_tile_parameters
          | :individual_ensemble_forecast_control_and_perturbed_interval_for_atmospheric_chemical_constituents_based_on_a_distribution_function
          | :individual_ensemble_reforecast_control_and_perturbed
          | :individual_ensemble_reforecast_control_and_perturbed_at_intervals
          | :partitioned_parameters
          | :percentile_forecasts
          | :percentile_forecasts_at_intervals
          | :post_processing_analysis_or_forecast
          | :post_processing_average_accumulation_extreme_values_at_intervals
          | :post_processing_individual_ensemble_forecast_control_and_perturbed
          | :post_processing_individual_ensemble_forecast_control_and_perturbed_at_intervals
          | :probability_forecasts
          | :probability_forecasts_at_intervals
          | :radar_product
          | :satellite_product
          | :satellite_product_with_or_without_associated_quality_values
          | :spatio_temporal_changing_tiles
          | :reserved
          | :reserved_for_local_use
          | :missing

  @spec get(id()) :: t()
  # Analysis or forecast at a horizontal level or in a horizontal layer at a point in time.  (see Template 4.0)
  def get(0), do: :analysis_or_forecast

  # Individual ensemble forecast control and perturbed at a horizontal level or in a horizontal layer at a point in time.  (see Template 4.1)
  def get(1), do: :individual_ensemble_forecast_control_and_perturbed

  # Derived forecasts based on all ensemble members at a horizontal level or in a horizontal layer at a point in time.  (see Template 4.2)
  def get(2), do: :derived_forecasts_based_on_all_ensemble_members

  # Derived forecasts based on a cluster of ensemble members over a rectangular area at a horizontal level or in a horizontal layer at a point in time.  (see Template 4.3)
  def get(3),
    do: :derived_forecasts_based_on_a_cluster_of_ensemble_members_over_a_rectangular_area

  # Derived forecasts based on a cluster of ensemble members over a circular area at a horizontal level or in a horizontal layer at a point in time.  (see Template 4.4)
  def get(4), do: :derived_forecasts_based_on_a_cluster_of_ensemble_members_over_a_circular_area

  # Probability forecasts at a horizontal level or in a horizontal layer at a point in time.  (see Template 4.5)
  def get(5), do: :probability_forecasts

  # Percentile forecasts at a horizontal level or in a horizontal layer at a point in time.  (see Template 4.6)
  def get(6), do: :percentile_forecasts

  # Analysis or forecast error at a horizontal level or in a horizontal layer at a point in time.  (see Template 4.7)
  def get(7), do: :analysis_or_forecast_error

  # Average accumulation extreme values or other statistically processed values at a horizontal level or in a horizontal layer in a continuous or non-continuous time interval.  (see Template 4.8)
  def get(8), do: :average_accumulation_extreme_values_at_intervals

  # Probability forecasts at a horizontal level or in a horizontal layer in a continuous or non-continuous time interval.  (see Template 4.9)
  def get(9), do: :probability_forecasts_at_intervals

  # Percentile forecasts at a horizontal level or in a horizontal layer in a continuous or non-continuous time interval.  (see Template 4.10)
  def get(10), do: :percentile_forecasts_at_intervals

  # Individual ensemble forecast control and perturbed at a horizontal level or in a horizontal layer in a continuous or non-continuous time interval.  (see Template 4.11)
  def get(11), do: :individual_ensemble_forecast_control_and_perturbed_at_intervals

  # Derived forecasts based on all ensemble members at a horizontal level or in a horizontal layer in a continuous or non-continuous time interval.  (see Template 4.12)
  def get(12), do: :derived_forecasts_based_on_all_ensemble_members_at_intervals

  # Derived forecasts based on a cluster of ensemble members over a rectangular area at a horizontal level or in a horizontal layer in a continuous or non-continuous time interval.  (see Template 4.13)
  def get(13),
    do:
      :derived_forecasts_based_on_a_cluster_of_ensemble_members_over_a_rectangular_area_at_intervals

  # Derived forecasts based on a cluster of ensemble members over a circular area at a horizontal level or in a horizontal layer in a continuous or non-continuous time interval.  (see Template 4.14)
  def get(14),
    do:
      :derived_forecasts_based_on_a_cluster_of_ensemble_members_over_a_circular_area_at_intervals

  # Average accumulation extreme values or other statistically-processed values over a spatial area at a horizontal level or in a horizontal layer at a point in time.  (see Template 4.15)
  def get(15),
    do:
      :average_accumulation_extreme_values_or_other_statistically_processed_values_over_a_spatial_area

  def get(n) when n >= 16 and n <= 19, do: :reserved
  # Radar product  (see Template 4.20)
  def get(20), do: :radar_product
  def get(n) when n >= 21 and n <= 29, do: :reserved

  # Satellite product  (see Template 4.30) NOTE: This template is deprecated. Template 4.31 should be used instead.
  def get(30), do: :satellite_product
  # Satellite product  (see Template 4.31)
  def get(31), do: :satellite_product

  # Analysis or forecast at a horizontal level or in a horizontal layer at a point in time for simulate (synthetic) satellite data (see Template 4.32)
  def get(32), do: :analysis_or_forecast_for_simulate

  # Individual Ensemble Forecast control and perturbed at a horizontal level or in a horizontal layer at a point in time for simulated (synthetic) satellite data (see Template 4.33)
  def get(33), do: :individual_ensemble_forecast_control_and_perturbed_for_simulated

  # Individual Ensemble Forecast control and perturbed at a horizontal level or in a horizontal layer in a continuous or non-continuous interval for simulated (synthetic) satellite data(see Template 4.34)
  def get(34), do: :individual_ensemble_forecast_control_and_perturbed_at_intervals_for_simulated
  # Satellite product with or without associated quality values (see Template 4.35)
  def get(35), do: :satellite_product_with_or_without_associated_quality_values
  def get(n) when n >= 36 and n <= 39, do: :reserved

  # Analysis or forecast at a horizontal level or in a horizontal layer at a point in time for atmospheric chemical constituents.  (see Template 4.40)
  def get(40), do: :analysis_or_forecast_for_atmospheric_chemical_constituents

  # Individual ensemble forecast control and perturbed at a horizontal level or in a horizontal layer at a point in time for atmospheric chemical constituents.  (see Template 4.41)
  def get(41),
    do: :individual_ensemble_forecast_control_and_perturbed_for_atmospheric_chemical_constituents

  # Average accumulation and or extreme values or other statistically processed values at a horizontal level or in a horizontal layer in a continuous or non-continuous time interval for atmospheric chemical constituents.  (see Template 4.42)
  def get(42), do: :average_accumulation_at_intervals_for_atmospheric_chemical_constituents

  # Individual ensemble forecast control and perturbed at a horizontal level or in a horizontal layer in a continuous or non-continuous time interval for atmospheric chemical constituents.  (see Template 4.43)
  def get(43),
    do:
      :individual_ensemble_forecast_control_and_perturbed_at_intervals_for_atmospheric_chemical_constituents

  # Analysis or forecast at a horizontal level or in a horizontal layer at a point in time for aerosol.  (see Template 4.44)
  def get(44), do: :analysis_or_forecast_for_aerosol

  # Individual ensemble forecast control and perturbed at a horizontal level or in a horizontal layer in a continuous or non-continuous time interval for aerosol.  (see Template 4.45)
  def get(45), do: :individual_ensemble_forecast_control_and_perturbed_at_intervals_for_aerosol

  # Average accumulation and or extreme values or other statistically processed values at a horizontal level or in a horizontal layer in a continuous or non-continuous time interval for aerosol.  (see Template 4.46)
  def get(46), do: :average_accumulation_at_intervals_for_aerosol

  # Individual ensemble forecast control and perturbed at a horizontal level or in a horizontal layer in a continuous or non-continuous time interval for aerosol.  (see Template 4.47)
  def get(47), do: :individual_ensemble_forecast_control_and_perturbed_at_intervals_for_aerosol

  # Analysis or forecast at a horizontal level or in a horizontal layer at a point in time for aerosol.  (see Template 4.48)
  def get(48), do: :analysis_or_forecast_for_aerosol

  # Individual ensemble forecast control and perturbed at a horizontal level or in a horizontal layer at a point in time for optical properties of aerosol. (see Template 4.49)
  def get(49),
    do: :individual_ensemble_forecast_control_and_perturbed_for_optical_properties_of_aerosol

  def get(50), do: :reserved

  # Categorical forecast at a horizontal level or in a horizontal layer at a point in time.  (see Template 4.51)
  def get(51), do: :categorical_forecast
  def get(52), do: :reserved

  # Partitioned parameters at a horizontal level or horizontal layer at a point in time.  (see Template 4.53)
  def get(53), do: :partitioned_parameters

  # Individual ensemble forecast control and perturbed at a horizontal level or in a horizontal layer at a point in time for partitioned parameters.   (see Template 4.54)
  def get(54), do: :individual_ensemble_forecast_control_and_perturbed_for_partitioned_parameters

  # Spatio-temporal changing tiles at a horizontal level or horizontal layer at a point in time (see Template 4.55)
  def get(55), do: :spatio_temporal_changing_tiles

  # Individual ensemble forecast control and perturbed at a horizontal level or in a horizontal layer at a point in time for spatio-temporal changing tile parameters.   (see Template 4.56)
  def get(56),
    do:
      :individual_ensemble_forecast_control_and_perturbed_for_spatio_temporal_changing_tile_parameters

  # Analysis or forecast at a horizontal level or in a horizontal layer at a point in time for atmospheric chemical constituents based on a distribution function (see Template 4.57)
  def get(57),
    do:
      :analysis_or_forecast_for_atmospheric_chemical_constituents_based_on_a_distribution_function

  # Individual Ensemble Forecast Control and Perturbed at a horizontal level or in a horizontal layer at a point in time interval for Atmospheric Chemical Constituents based on a distribution function (see Template 4.58)
  def get(58),
    do:
      :individual_ensemble_forecast_control_and_perturbed_interval_for_atmospheric_chemical_constituents_based_on_a_distribution_function

  # Individual ensemble forecast control and perturbed at a horizontal level or in a horizontal layer at a point in time for spatio-temporal changing tile parameters (corrected version of template 4.56 - See Template 4.59)
  def get(59),
    do:
      :individual_ensemble_forecast_control_and_perturbed_for_spatio_temporal_changing_tile_parameters

  # Individual Ensemble Reforecast control and perturbed at a horizontal level or in a horizontal layer at a point in time. (see Template 4.60)
  def get(60), do: :individual_ensemble_reforecast_control_and_perturbed

  # Individual Ensemble Reforecast control and perturbed at a horizontal level or in a horizontal layer in a continuous or non-continuous time interval (see Template 4.61)
  def get(61), do: :individual_ensemble_reforecast_control_and_perturbed_at_intervals

  # Average Accumulation and or Extreme values or other Statistically-processed values at a horizontal level or in a horizontal layer in a continuous or non-continuous time interval for spatio-temporal changing tiles at a horizontal level or horizontal layer at a point in time (see Template 4.62)
  def get(62), do: :average_accumulation_at_intervals_for_spatio_temporal_changing_tiles

  # Individual ensemble forecast control and perturbed at a horizontal level or in a horizontal layer in a continuous or non-continuous time interval for spatio-temporal changing tiles (see Template 4.63)
  def get(63),
    do:
      :individual_ensemble_forecast_control_and_perturbed_at_intervals_for_spatio_temporal_changing_tiles

  def get(n) when n >= 64 and n <= 66, do: :reserved

  # Average accumulation and or extreme values or other statistically processed values at a horizontal level or in a horizontal layer in a continuous or non-continuous time interval for atmospheric chemical constituents based on a distribution function (see Template 4.67)
  def get(67),
    do:
      :average_accumulation_at_intervals_for_atmospheric_chemical_constituents_based_on_a_distribution_function

  # Individual ensemble forecast control and perturbed at a horizontal level or in a horizontal layer in a continuous or non-continuous time interval for atmospheric chemical constituents based on a distribution function. (see Template 4.68)
  def get(68),
    do:
      :individual_ensemble_forecast_control_and_perturbed_at_intervals_for_atmospheric_chemical_constituents_based_on_a_distribution_function

  def get(69), do: :reserved

  # Post-processing analysis or forecast at a horizontal level or in a horizontal layer at a point in time. (see Template 4.70)
  def get(70), do: :post_processing_analysis_or_forecast

  # Post-processing individual ensemble forecast control and perturbed at a horizontal level or in a horizontal layer at a point in time. (see Template 4.71)
  def get(71), do: :post_processing_individual_ensemble_forecast_control_and_perturbed

  # Post-processing average accumulation extreme values or other statistically processed values at a horizontal level or in a horizontal layer in a continuous or non-continuous time interval. (see Template 4.72)
  def get(72), do: :post_processing_average_accumulation_extreme_values_at_intervals

  # Post-processing individual ensemble forecast control and perturbed at a horizontal level or in a horizontal layer in a continuous or non-continuous time interval. (see Template 4.73)
  def get(73),
    do: :post_processing_individual_ensemble_forecast_control_and_perturbed_at_intervals

  def get(n) when n >= 74 and n <= 90, do: :reserved

  # Categorical forecast at a horizontal level or in a horizontal layer in a continuous or non-continuous time interval.  (see Template 4.91)
  def get(91), do: :categorical_forecast_at_intervals
  def get(n) when n >= 92 and n <= 253, do: :reserved
  # CCITT IA5 character string  (see Template 4.254)
  def get(254), do: :ccitt_ia
  def get(n) when n >= 255 and n <= 999, do: :reserved
  # Cross-section of analysis and forecast at a point in time.  (see Template 4.1000)
  def get(1000), do: :cross_section_of_analysis_and_forecast_at_a_point_in_time

  # Cross-section of averaged or otherwise statistically processed analysis or forecast over a range of time.  (see Template 4.1001)
  def get(1001),
    do:
      :cross_section_of_averaged_or_otherwise_statistically_processed_analysis_or_forecast_over_a_range_of_time

  # Cross-section of analysis and forecast averaged or otherwise statistically-processed over latitude or longitude.  (see Template 4.1002)
  def get(1002),
    do:
      :cross_section_of_analysis_and_forecast_averaged_or_otherwise_statistically_processed_over_latitude_or_longitude

  def get(n) when n >= 1003 and n <= 1099, do: :reserved
  # Hovmoller-type grid with no averaging or other statistical processing  (see Template 4.1100)
  def get(1100), do: :hovmoller_type_grid_with_no_averaging_or_other_statistical_processing
  # Hovmoller-type grid with averaging or other statistical processing  (see Template 4.1101)
  def get(1101), do: :hovmoller_type_grid_with_averaging_or_other_statistical_processing
  def get(n) when n >= 1102 and n <= 32767, do: :reserved
  def get(n) when n >= 32768 and n <= 65534, do: :reserved_for_local_use
  def get(65535), do: :missing
end
