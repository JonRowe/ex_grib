defmodule ExGrib.Grib2.Section4.OperatingMode do
  @moduledoc """
  Table 4.12

  Operating mode

  https://www.nco.ncep.noaa.gov/pmb/docs/grib2/grib2_doc/grib2_table4-12.shtml
  """

  @type id :: integer()
  @type t ::
          :clear_air
          | :maintenance_mode
          | :precipitation
          | :reserved
          | :reserved_for_local_use
          | :missing

  @spec get(id()) :: t()
  def get(0), do: :maintenance_mode
  def get(1), do: :clear_air
  def get(2), do: :precipitation
  def get(n) when n >= 3 and n <= 191, do: :reserved
  def get(n) when n >= 192 and n <= 254, do: :reserved_for_local_use
  def get(255), do: :missing
end
