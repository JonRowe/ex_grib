defmodule ExGrib.Grib2.Section4.QualityControlIndicator do
  @moduledoc """
  Table 4.13

  Quality control indicator

  https://www.nco.ncep.noaa.gov/pmb/docs/grib2/grib2_doc/grib2_table4-13.shtml
  """

  @type id :: integer()
  @type t ::
          :no_quality_control_applied
          | :quality_control_applied
          | :reserved
          | :reserved_for_local_use
          | :missing

  @spec get(id()) :: t()
  def get(0), do: :no_quality_control_applied
  def get(1), do: :quality_control_applied
  def get(n) when n >= 2 and n <= 191, do: :reserved
  def get(n) when n >= 192 and n <= 254, do: :reserved_for_local_use
  def get(255), do: :missing
end
