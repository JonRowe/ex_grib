defmodule ExGrib.Grib2.Discipline do
  @moduledoc """
  Returns disciplines looked up from a Grib integer.

  https://www.nco.ncep.noaa.gov/pmb/docs/grib2/grib2_doc/grib2_table0-0.shtml
  """

  @spec get(integer()) :: atom()
  def get(0), do: :meteorological
  def get(1), do: :hydrological
  def get(2), do: :land_surface
  def get(3), do: :satellite_remote_sensing
  def get(4), do: :space_weather
  def get(n) when n >= 5 and n <= 9, do: :reserved
  def get(10), do: :oceanographic
  def get(n) when n >= 11 and n <= 191, do: :reserved
  def get(n) when n >= 192 and n <= 254, do: :reserved_for_local_use
  def get(255), do: :missing
end
