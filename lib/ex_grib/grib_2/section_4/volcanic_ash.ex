defmodule ExGrib.Grib2.Section4.VolcanicAsh do
  @moduledoc """
  Table 4.206

  Volcanic ash

  https://www.nco.ncep.noaa.gov/pmb/docs/grib2/grib2_doc/grib2_table4-206.shtml
  """

  @type id :: integer()
  @type t ::
          :not_present
          | :present
          | :reserved
          | :reserved_for_local_use
          | :missing

  @spec get(id()) :: t()
  def get(0), do: :not_present
  def get(1), do: :present
  def get(n) when n >= 2 and n <= 191, do: :reserved
  def get(n) when n >= 192 and n <= 254, do: :reserved_for_local_use
  def get(255), do: :missing
end
