defmodule ExGrib.Grib2.Section4.CoverageAttributes do
  @moduledoc """
  Table 4.241

  Coverage attributes

  https://www.nco.ncep.noaa.gov/pmb/docs/grib2/grib2_doc/grib2_table4-241.shtml
  """

  @type id :: integer()
  @type t ::
          :flooded
          | :ice_covered
          | :snow_covered
          | :undefined
          | :unmodified
          | :reserved
          | :reserved_for_local_use
          | :missing

  @spec get(id()) :: t()
  def get(0), do: :undefined
  def get(1), do: :unmodified
  def get(2), do: :snow_covered
  def get(3), do: :flooded
  def get(4), do: :ice_covered
  def get(n) when n >= 5 and n <= 191, do: :reserved
  def get(n) when n >= 192 and n <= 254, do: :reserved_for_local_use
  def get(255), do: :missing
end
