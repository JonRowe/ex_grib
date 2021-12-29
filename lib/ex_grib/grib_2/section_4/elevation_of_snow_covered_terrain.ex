defmodule ExGrib.Grib2.Section4.ElevationOfSnowCoveredTerrain do
  @moduledoc """
  Table 4.216

  Elevation of snow covered terrain

  https://www.nco.ncep.noaa.gov/pmb/docs/grib2/grib2_doc/grib2_table4-216.shtml
  """

  @type id :: integer()
  @type t ::
          :clouds
          | :elevation_in_increments_of
          | :reserved
          | :missing

  @spec get(id()) :: t()
  # Elevation in increments of 100 m
  def get(n) when n >= 0 and n <= 90, do: :elevation_in_increments_of
  def get(n) when n >= 91 and n <= 253, do: :reserved
  def get(254), do: :clouds
  def get(255), do: :missing
end
