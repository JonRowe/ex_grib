defmodule ExGrib.Grib2.Section4.ContrailIntensity do
  @moduledoc """
  Table 4.210

  Contrail intensity

  https://www.nco.ncep.noaa.gov/pmb/docs/grib2/grib2_doc/grib2_table4-210.shtml
  """

  @type id :: integer()
  @type t ::
          :contrail_not_present
          | :contrail_present
          | :reserved
          | :reserved_for_local_use
          | :missing

  @spec get(id()) :: t()
  def get(0), do: :contrail_not_present
  def get(1), do: :contrail_present
  def get(n) when n >= 2 and n <= 191, do: :reserved
  def get(n) when n >= 192 and n <= 254, do: :reserved_for_local_use
  def get(255), do: :missing
end
