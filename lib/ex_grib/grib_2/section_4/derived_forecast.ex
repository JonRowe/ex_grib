defmodule ExGrib.Grib2.Section4.DerivedForecast do
  @moduledoc """
  Table 4.7

  Derived forecast

  Notes:

  1. Large anomaly index is defined as (number of members whose
  anomaly is higher than 0.5*SD) - (number of members whose anomaly is
  lower than -0.5*SD)}/(number of members) at each grid point.

  SD is the observed climatological standard deviation.

  2. It should be noted that the reference for "minimum of all ensemble members"
  and "maximum of all ensemble members" is the set of ensemble members and not a time
  interval and should not be confused with the maximum and minimum described by
  Product Definition Template 4.8.

  https://www.nco.ncep.noaa.gov/pmb/docs/grib2/grib2_doc/grib2_table4-7.shtml
  """

  @type id :: integer()
  @type t ::
          :climate_percentile
          | :deviation_of_ensemble_mean_from_daily_climatology
          | :equally_weighted_mean
          | :extreme_forecast_index
          | :interquartile_range
          | :large_anomaly_index_of_all_members
          | :maximum_of_all_ensemble_members
          | :minimum_of_all_ensemble_members
          | :percentile_value
          | :spread_of_all_members
          | :standard_deviation_with_respect_to_cluster_mean
          | :statistically_decided_weights_for_each_ensemble_member
          | :unweighted_mean_of_all_members
          | :unweighted_mean_of_the_cluster_members
          | :unweighted_mode_of_all_members
          | :weighted_mean_of_all_members
          | :reserved
          | :reserved_for_local_use
          | :missing

  @spec get(id()) :: t()
  def get(0), do: :unweighted_mean_of_all_members
  def get(1), do: :weighted_mean_of_all_members
  def get(2), do: :standard_deviation_with_respect_to_cluster_mean
  # Standard Deviation with respect to Cluster Mean, Normalized
  def get(3), do: :standard_deviation_with_respect_to_cluster_mean
  def get(4), do: :spread_of_all_members
  # Large Anomaly Index of All Members (see Note 1)
  def get(5), do: :large_anomaly_index_of_all_members
  def get(6), do: :unweighted_mean_of_the_cluster_members
  # Interquartile Range (Range between the 25th and 75th quantile)
  def get(7), do: :interquartile_range
  # Minimum Of All Ensemble Members (see Note 2)
  def get(8), do: :minimum_of_all_ensemble_members
  # Maximum Of All Ensemble Members (see Note 2)
  def get(9), do: :maximum_of_all_ensemble_members
  def get(n) when n >= 7 and n <= 191, do: :reserved
  def get(n) when n >= 192 and n <= 254, do: :reserved_for_local_use
  def get(192), do: :unweighted_mode_of_all_members
  # Percentile value (10%) of All Members
  def get(193), do: :percentile_value
  # Percentile value (50%) of All Members
  def get(194), do: :percentile_value
  # Percentile value (90%) of All Members
  def get(195), do: :percentile_value
  def get(196), do: :statistically_decided_weights_for_each_ensemble_member
  # Climate Percentile (percentile values from climate distribution)
  def get(197), do: :climate_percentile
  def get(198), do: :deviation_of_ensemble_mean_from_daily_climatology
  def get(199), do: :extreme_forecast_index
  def get(200), do: :equally_weighted_mean
  # Percentile value (5%) of All Members
  def get(201), do: :percentile_value
  # Percentile value (25%) of All Members
  def get(202), do: :percentile_value
  # Percentile value (75%) of All Members
  def get(203), do: :percentile_value
  # Percentile value (95%) of All Members
  def get(204), do: :percentile_value
  def get(255), do: :missing
end
