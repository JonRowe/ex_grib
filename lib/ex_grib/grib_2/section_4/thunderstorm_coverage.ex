defmodule ExGrib.Grib2.Section4.ThunderstormCoverage do
  @moduledoc """
  Table 4.204

  Thunderstorm coverage

  https://www.nco.ncep.noaa.gov/pmb/docs/grib2/grib2_doc/grib2_table4-204.shtml
  """

  @type id :: integer()
  @type t ::
          :few
          | :isolated
          | :none
          | :numerous
          | :scattered
          | :reserved
          | :reserved_for_local_use
          | :missing

  @spec get(id()) :: t()
  def get(0), do: :none
  # Isolated (1-2%)
  def get(1), do: :isolated
  # Few (3-5%)
  def get(2), do: :few
  # Scattered (16-45%)
  def get(3), do: :scattered
  # Numerous (>45%)
  def get(4), do: :numerous
  def get(n) when n >= 5 and n <= 191, do: :reserved
  def get(n) when n >= 192 and n <= 254, do: :reserved_for_local_use
  def get(255), do: :missing
end
