defmodule ExGrib.Grib2.Section4.HorizontalDimensionProcessed do
  @moduledoc """
  Table 4.220

  Horizontal dimension processed

  https://www.nco.ncep.noaa.gov/pmb/docs/grib2/grib2_doc/grib2_table4-220.shtml
  """

  @type id :: integer()
  @type t ::
          :latitude
          | :longitude
          | :reserved
          | :reserved_for_local_use
          | :missing

  @spec get(id()) :: t()
  def get(0), do: :latitude
  def get(1), do: :longitude
  def get(n) when n >= 2 and n <= 191, do: :reserved
  def get(n) when n >= 192 and n <= 254, do: :reserved_for_local_use
  def get(255), do: :missing
end
