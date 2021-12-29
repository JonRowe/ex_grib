defmodule ExGrib.Grib2.Section4.CloudMaskType do
  @moduledoc """
  Table 4.217

  Cloud mask type

  https://www.nco.ncep.noaa.gov/pmb/docs/grib2/grib2_doc/grib2_table4-217.shtml
  """

  @type id :: integer()
  @type t ::
          :clear_over_land
          | :clear_over_water
          | :cloud
          | :no_data
          | :reserved
          | :reserved_for_local_use
          | :missing

  @spec get(id()) :: t()
  def get(0), do: :clear_over_water
  def get(1), do: :clear_over_land
  def get(2), do: :cloud
  def get(3), do: :no_data
  def get(n) when n >= 4 and n <= 191, do: :reserved
  def get(n) when n >= 192 and n <= 254, do: :reserved_for_local_use
  def get(255), do: :missing
end
