defmodule ExGrib.Grib2.Section4.FireDetectionIndicator do
  @moduledoc """
  Table 4.223

  Fire detection indicator

  https://www.nco.ncep.noaa.gov/pmb/docs/grib2/grib2_doc/grib2_table4-223.shtml
  """

  @type id :: integer()
  @type t ::
          :no_fire_detected
          | :possible_fire_detected
          | :probable_fire_detected
          | :reserved
          | :reserved_for_local_use
          | :missing

  @spec get(id()) :: t()
  def get(0), do: :no_fire_detected
  def get(1), do: :possible_fire_detected
  def get(2), do: :probable_fire_detected
  def get(3), do: :missing
  def get(n) when n >= 4 and n <= 191, do: :reserved
  def get(n) when n >= 192 and n <= 254, do: :reserved_for_local_use
  def get(255), do: :missing
end
