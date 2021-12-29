defmodule ExGrib.Grib2.Section4.IndicatorOfUnitOfTimeRange do
  @moduledoc """
  Table 4.4

  Indicator of unit of time range

  https://www.nco.ncep.noaa.gov/pmb/docs/grib2/grib2_doc/grib2_table4-4.shtml
  """

  @type id :: integer()
  @type t ::
          :minute
          | :hour
          | :day
          | :month
          | :year
          | :decade
          | :normal
          | :century
          | :reserved
          | :reserved
          | :"3_hours"
          | :"6_hours"
          | :"12_hours"
          | :second
          | :reserved
          | :reserved_for_local_use
          | :missing

  @spec get(id()) :: t()
  def get(0), do: :minute
  def get(1), do: :hour
  def get(2), do: :day
  def get(3), do: :month
  def get(4), do: :year
  # Decade (10 Years)
  def get(5), do: :decade
  # Normal (30 Years)
  def get(6), do: :normal
  # Century (100 Years)
  def get(7), do: :century
  def get(8), do: :reserved
  def get(9), do: :reserved
  def get(10), do: :"3_hours"
  def get(11), do: :"6_hours"
  def get(12), do: :"12_hours"
  def get(13), do: :second
  def get(n) when n >= 14 and n <= 191, do: :reserved
  def get(n) when n >= 192 and n <= 254, do: :reserved_for_local_use
  def get(255), do: :missing
end
