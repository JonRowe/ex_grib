defmodule ExGrib.Grib2.Section4.SoilTextureFraction do
  @moduledoc """
  Table 4.236

  Soil texture fraction (to be used as partitioned parameter in pdt 4.53 or 4.54)

  https://www.nco.ncep.noaa.gov/pmb/docs/grib2/grib2_doc/grib2_table4-236.shtml
  """

  @type id :: integer()
  @type t ::
          :coarse
          | :fine
          | :medium
          | :medium_fine
          | :organic
          | :tropical_organic
          | :very_fine
          | :reserved
          | :reserved_for_local_use
          | :missing

  @spec get(id()) :: t()
  def get(1), do: :coarse
  def get(2), do: :medium
  def get(3), do: :medium_fine
  def get(4), do: :fine
  def get(5), do: :very_fine
  def get(6), do: :organic
  def get(7), do: :tropical_organic
  def get(n) when n >= 8 and n <= 191, do: :reserved
  def get(n) when n >= 192 and n <= 254, do: :reserved_for_local_use
  def get(255), do: :missing
end
