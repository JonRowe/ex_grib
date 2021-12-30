defmodule ExGrib.Grib2.Section4.ProbabilityType do
  @moduledoc """
  Table 4.9

  Probability type

  Notes:

  (1). Above normal, near normal and below normal are defined as three equiprobable categories based
  on climatology at each point over the geographical area covered by the grid. The type and methodology of
  the reference climatology are unspecified and should be documented concurrently by the data producer.

  (2). Product definition templates that use Code Table 4.9 may contain octets to store the values of
  lower and upper limits. When categorical probability is used (such as below, near and above normal), these
  octets shall be set to “all ones” (missing).

  https://www.nco.ncep.noaa.gov/pmb/docs/grib2/grib2_doc/grib2_table4-9.shtml
  """

  @type id :: integer()
  @type t ::
          :probability_of_event_above_lower_limit
          | :probability_of_event_above_upper_limit
          | :probability_of_event_below_lower_limit
          | :probability_of_event_below_upper_limit
          | :probability_of_event_between_upper_and_lower_limits_limit
          | :probability_of_event_equal_to_lower_limit
          | :probability_of_event_in_above_normal_category
          | :reserved
          | :reserved_for_local_use
          | :missing

  @spec get(id()) :: t()
  def get(0), do: :probability_of_event_below_lower_limit
  def get(1), do: :probability_of_event_above_upper_limit

  # Probability of event between upper and lower limits (the range includes lower limit but no the upper limit)
  def get(2), do: :probability_of_event_between_upper_and_lower_limits_limit
  def get(3), do: :probability_of_event_above_lower_limit
  def get(4), do: :probability_of_event_below_upper_limit
  def get(5), do: :probability_of_event_equal_to_lower_limit
  # Probability of event in above normal category (see Notes 1 and 2)
  def get(6), do: :probability_of_event_in_above_normal_category
  def get(n) when n >= 9 and n <= 191, do: :reserved
  def get(n) when n >= 192 and n <= 254, do: :reserved_for_local_use
  def get(255), do: :missing
end
