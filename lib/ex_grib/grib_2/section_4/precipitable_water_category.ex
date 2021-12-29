defmodule ExGrib.Grib2.Section4.PrecipitableWaterCategory do
  @moduledoc """
  Table 4.202

  Precipitable water category

  https://www.nco.ncep.noaa.gov/pmb/docs/grib2/grib2_doc/grib2_table4-202.shtml
  """

  @type id :: integer()
  @type t ::
          :reserved
          | :reserved_for_local_use
          | :missing

  @spec get(id()) :: t()
  def get(n) when n >= 0 and n <= 191, do: :reserved
  def get(n) when n >= 192 and n <= 254, do: :reserved_for_local_use
  def get(255), do: :missing
end
