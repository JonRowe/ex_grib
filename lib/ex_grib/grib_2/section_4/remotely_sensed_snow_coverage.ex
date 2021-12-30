defmodule ExGrib.Grib2.Section4.RemotelySensedSnowCoverage do
  @moduledoc """
  Table 4.215

  Remotely sensed snow coverage

  https://www.nco.ncep.noaa.gov/pmb/docs/grib2/grib2_doc/grib2_table4-215.shtml
  """

  @type id :: integer()
  @type t ::
          :clouds
          | :no_snow
          | :snow
          | :reserved
          | :reserved_for_local_use
          | :missing

  @spec get(id()) :: t()
  def get(n) when n >= 0 and n <= 49, do: :reserved
  # No-Snow/No-Cloud
  def get(50), do: :no_snow
  def get(n) when n >= 51 and n <= 99, do: :reserved
  def get(100), do: :clouds
  def get(n) when n >= 101 and n <= 249, do: :reserved
  def get(250), do: :snow
  def get(n) when n >= 192 and n <= 254, do: :reserved_for_local_use
  def get(255), do: :missing
end
