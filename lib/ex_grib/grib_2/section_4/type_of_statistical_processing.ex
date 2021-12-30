defmodule ExGrib.Grib2.Section4.TypeOfStatisticalProcessing do
  @moduledoc """
  Table 4.10

  Type of statistical processing

  Notes:

  1. The original data value (Y in the note 4 of regulation 92.9.4)
    has units of Code table 4.2 multiplied by second, unless otherwise noted
    on Code table 4.2.

  2.  The original data value has squared units of Code table 4.2.

  3.  The original data value is non-dimensional number without units.

  4.  The original data value is non-dimensional number from 0 to 1, where
    0 indicates no confidence and 1 indicates maximal confidence.

  5.  The original data value is defined by Code Table 4.244.

  https://www.nco.ncep.noaa.gov/pmb/docs/grib2/grib2_doc/grib2_table4-10.shtml
  """

  @type id :: integer()
  @type t ::
          :accumulation
          | :average
          | :average_of_forecast_accumulations_accumulation_period_forecast_number_of_forecasts_used
          | :average_of_forecast_accumulations_p1_start_of_accumulation_period_p2_end_of_accumulation_period_reference_time_is_the_start_time_of_the_first_forecast_at
          | :average_of_forecast_averages_p1_start_of_averaging_period_p2_end_of_averaging_period_reference_time_is_the_start_time_of_the_first_forecast_at
          | :average_of_forecast_averages_reference_time_is_the_start_time_of_the_first_forecast_at
          | :average_of_n_forecasts_product_has_forecast_period_of_p_products_have_reference_times_at_intervals_of_p_given_reference_time
          | :average_of_n_uninitialized_analyses_reference_time
          | :average_of_successive_forecast_accumulations_accumulation_period_forecast_number_of_forecasts_used
          | :average_of_successive_forecast_averages_reference_time_is_the_start_time_of_the_first_forecast_at
          | :climatological_average_of_n_analyses_and_for_the_period_from_r
          | :climatological_average_of_n_forecasts_and_for_the_period_from_r
          | :climatological_mean_value
          | :climatological_root_mean_square_difference_between_n_forecasts_and_their_verifying_analyses_and_for_the_period_from_r
          | :climatological_standard_deviation_of_n_analyses_from_the_mean_of_the_same_n_analyses_for_analyses_one_year_apart_period_r
          | :climatological_standard_deviation_of_n_forecasts_from_the_mean_of_the_same_n_forecasts_starts_wtih_initial_time_r_and_is_for_the_period_from_r
          | :covariance
          | :difference_beginning_of_the_time_range_minus_value_at_the_end
          | :difference_the_time_range_minus_value_at_the_beginning
          | :maximum
          | :minimum
          | :ratio
          | :root_mean_square
          | :standard_deviation
          | :reserved
          | :reserved_for_local_use
          | :missing

  @spec get(id()) :: t()
  def get(0), do: :average
  # Accumulation (see Note 1)
  def get(1), do: :accumulation
  def get(2), do: :maximum
  def get(3), do: :minimum
  # Difference (value at the end of the time range minus value at the beginning)
  def get(4), do: :difference_the_time_range_minus_value_at_the_beginning
  def get(5), do: :root_mean_square
  def get(6), do: :standard_deviation
  # Covariance (temporal variance) (see Note 2)
  def get(7), do: :covariance
  # Difference ( value at the beginning of the time range minus value at the end)
  def get(8), do: :difference_beginning_of_the_time_range_minus_value_at_the_end
  # Ratio (see Note 3)
  def get(9), do: :ratio
  def get(n) when n >= 14 and n <= 191, do: :reserved
  def get(n) when n >= 192 and n <= 254, do: :reserved_for_local_use

  #  Climatological Mean Value: multiple year averages of quantities which are themselves means over some period of time (P2) less than a year. The reference time (R) indicates the date and time of the start of a period of time, given by R to R + P2, over which a mean is formed; N indicates the number of such period-means that are averaged together to form the climatological value, assuming that the N period-mean fields are separated by one year. The reference time indicates the start of the N-year climatology. N is given in octets 22-23 of the PDS. If P1 = 0 then the data averaged in the basic interval P2 are assumed to be continuous, i.e., all available data are simply averaged together. If P1 = 1 (the units of time - octet 18, code table 4 - are not relevant here) then the data averaged together in the basic interval P2 are valid only at the time (hour, minute) given in the reference time, for all the days included in the P2 period. The units of P2 are given by the contents of octet 18 and Table 4.
  def get(192), do: :climatological_mean_value

  # Average of N forecasts (or initialized analyses); each product has forecast period of P1 (P1=0 for initialized analyses); products have reference times at intervals of P2, beginning at the given reference time.
  def get(193),
    do:
      :average_of_n_forecasts_product_has_forecast_period_of_p_products_have_reference_times_at_intervals_of_p_given_reference_time

  # Average of N uninitialized analyses, starting at reference time, at intervals of P2.
  def get(194), do: :average_of_n_uninitialized_analyses_reference_time

  # Average of forecast accumulations. P1 = start of accumulation period. P2 = end of accumulation period. Reference time is the start time of the first forecast, other forecasts at 24-hour intervals. Number in Ave = number of forecasts used.
  def get(195),
    do: :average_of_forecast_accumulations_accumulation_period_forecast_number_of_forecasts_used

  # Average of successive forecast accumulations. P1 = start of accumulation period. P2 = end of accumulation period. Reference time is the start time of the first forecast, other forecasts at (P2 - P1) intervals. Number in Ave = number of forecasts used
  def get(196),
    do:
      :average_of_successive_forecast_accumulations_accumulation_period_forecast_number_of_forecasts_used

  # Average of forecast averages. P1 = start of averaging period. P2 = end of averaging period. Reference time is the start time of the first forecast, other forecasts at 24-hour intervals. Number in Ave = number of forecast used
  def get(197),
    do: :average_of_forecast_averages_reference_time_is_the_start_time_of_the_first_forecast_at

  # Average of successive forecast averages. P1 = start of averaging period. P2 = end of averaging period. Reference time is the start time of the first forecast, other forecasts at (P2 - P1) intervals. Number in Ave = number of forecasts used
  def get(198),
    do:
      :average_of_successive_forecast_averages_reference_time_is_the_start_time_of_the_first_forecast_at

  # Climatological Average of N analyses, each a year apart, starting from initial time R and for the period from R+P1 to R+P2.
  def get(199), do: :climatological_average_of_n_analyses_and_for_the_period_from_r

  # Climatological Average of N forecasts, each a year apart, starting from initial time R and for the period from R+P1 to R+P2.
  def get(200), do: :climatological_average_of_n_forecasts_and_for_the_period_from_r

  # Climatological Root Mean Square difference between N forecasts and their verifying analyses, each a year apart, starting with initial time R and for the period from R+P1 to R+P2.
  def get(201),
    do:
      :climatological_root_mean_square_difference_between_n_forecasts_and_their_verifying_analyses_and_for_the_period_from_r

  # Climatological Standard Deviation of N forecasts from the mean of the same N forecasts, for forecasts one year apart. The first forecast starts wtih initial time R and is for the period from R+P1 to R+P2.
  def get(202),
    do:
      :climatological_standard_deviation_of_n_forecasts_from_the_mean_of_the_same_n_forecasts_starts_wtih_initial_time_r_and_is_for_the_period_from_r

  # Climatological Standard Deviation of N analyses from the mean of the same N analyses, for analyses one year apart. The first analyses is valid for  period R+P1 to R+P2.
  def get(203),
    do:
      :climatological_standard_deviation_of_n_analyses_from_the_mean_of_the_same_n_analyses_for_analyses_one_year_apart_period_r

  # Average of forecast accumulations. P1 = start of accumulation period. P2 = end of accumulation period. Reference time is the start time of the first forecast, other forecasts at 6-hour intervals. Number in Ave = number of forecast used
  def get(204),
    do:
      :average_of_forecast_accumulations_p1_start_of_accumulation_period_p2_end_of_accumulation_period_reference_time_is_the_start_time_of_the_first_forecast_at

  # Average of forecast averages. P1 = start of averaging period. P2 = end of averaging period. Reference time is the start time of the first forecast, other forecasts at 6-hour intervals. Number in Ave = number of forecast used
  def get(205),
    do:
      :average_of_forecast_averages_p1_start_of_averaging_period_p2_end_of_averaging_period_reference_time_is_the_start_time_of_the_first_forecast_at

  # Average of forecast accumulations. P1 = start of accumulation period. P2 = end of accumulation period. Reference time is the start time of the first forecast, other forecasts at 12-hour intervals. Number in Ave = number of forecast used
  def get(206),
    do:
      :average_of_forecast_accumulations_p1_start_of_accumulation_period_p2_end_of_accumulation_period_reference_time_is_the_start_time_of_the_first_forecast_at

  # Average of forecast averages. P1 = start of averaging period. P2 = end of averaging period. Reference time is the start time of the first forecast, other forecasts at 12-hour intervals. Number in Ave = number of forecast used
  def get(207),
    do:
      :average_of_forecast_averages_p1_start_of_averaging_period_p2_end_of_averaging_period_reference_time_is_the_start_time_of_the_first_forecast_at

  def get(255), do: :missing
end
