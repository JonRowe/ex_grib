defmodule ExGrib.Grib2.Section4.TypeOfTimeIntervals do
  @moduledoc """
  Table 4.11

  Type of time intervals

  Notes:

  1. Code figure 5 applies to instances where a single time subinterval was used
  to calculate the statistically processed field.

  The exact starting and ending times of the subinterval are not given, but it is known
  that itb is contained inclusively between the beginning time and the ending time of
  the overall interval.

  https://www.nco.ncep.noaa.gov/pmb/docs/grib2/grib2_doc/grib2_table4-11.shtml
  """

  @type id :: integer()
  @type t ::
          :floating_subinterval_of_time_between_forecast_time_and_end_of_overall_time_interval
          | :successive_times_processed_have_same_forecast_time
          | :successive_times_processed_have_same_start_time_of_forecast
          | :successive_times_processed_have_start_time_of_forecast_decremented_and_forecast_time_incremented_so_that_valid_time_remains_constant
          | :successive_times_processed_have_start_time_of_forecast_incremented_and_forecast_time_decremented_so_that_valid_time_remains_constant
          | :reserved
          | :reserved_for_local_use
          | :missing

  @spec get(id()) :: t()
  def get(0), do: :reserved
  # Successive times processed have same forecast time, start time of forecast is incremented.
  def get(1), do: :successive_times_processed_have_same_forecast_time
  # Successive times processed have same start time of forecast, forecast time is incremented.
  def get(2), do: :successive_times_processed_have_same_start_time_of_forecast

  # Successive times processed have start time of forecast incremented and forecast time decremented so that valid time remains constant.
  def get(3),
    do:
      :successive_times_processed_have_start_time_of_forecast_incremented_and_forecast_time_decremented_so_that_valid_time_remains_constant

  # Successive times processed have start time of forecast decremented and forecast time incremented so that valid time remains constant.
  def get(4),
    do:
      :successive_times_processed_have_start_time_of_forecast_decremented_and_forecast_time_incremented_so_that_valid_time_remains_constant

  # Floating subinterval of time between forecast time and end of overall time interval.(see Note 1)
  def get(5),
    do: :floating_subinterval_of_time_between_forecast_time_and_end_of_overall_time_interval

  def get(n) when n >= 6 and n <= 191, do: :reserved
  def get(n) when n >= 192 and n <= 254, do: :reserved_for_local_use
  def get(255), do: :missing
end
