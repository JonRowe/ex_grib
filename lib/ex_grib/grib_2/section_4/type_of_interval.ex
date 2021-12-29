defmodule ExGrib.Grib2.Section4.TypeOfInterval do
  @moduledoc """
  Table 4.91

  Type of interval

  https://www.nco.ncep.noaa.gov/pmb/docs/grib2/grib2_doc/grib2_table4-91.shtml
  """

  @type id :: integer()
  @type t ::
          :between_first_and_second_limit_including_both_limits
          | :between_first_and_second_limit_including_first_limit
          | :between_first_and_second_limit_including_second_limit
          | :equal_to_first_limit
          | :greater_or_equal_first_limit
          | :greater_or_equal_second_limit
          | :greater_than_first_limit
          | :greater_than_second_limit
          | :smaller_or_equal_first_limit
          | :smaller_or_equal_second_limit
          | :smaller_than_first_limit
          | :smaller_than_second_limit
          | :reserved
          | :reserved_for_local_use
          | :missing

  @spec get(id()) :: t()
  def get(0), do: :smaller_than_first_limit
  def get(1), do: :greater_than_second_limit
  # Between first and second limit.  The range includes the first limit but not the second limit.
  def get(2), do: :between_first_and_second_limit_including_first_limit
  def get(3), do: :greater_than_first_limit
  def get(4), do: :smaller_than_second_limit
  def get(5), do: :smaller_or_equal_first_limit
  def get(6), do: :greater_or_equal_second_limit
  # Between first and second limit. The range includes the first limit and the second limit.
  def get(7), do: :between_first_and_second_limit_including_both_limits
  def get(8), do: :greater_or_equal_first_limit
  def get(9), do: :smaller_or_equal_second_limit
  # Between first and second limit. The range includes the second limit but not the first limit.
  def get(10), do: :between_first_and_second_limit_including_second_limit
  def get(11), do: :equal_to_first_limit
  def get(n) when n >= 12 and n <= 191, do: :reserved
  def get(n) when n >= 192 and n <= 254, do: :reserved_for_local_use
  def get(255), do: :missing
end
