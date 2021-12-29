defmodule ExGrib.Grib2.Section4.ContrailEngineType do
  @moduledoc """
  Table 4.211

  Contrail engine type

  https://www.nco.ncep.noaa.gov/pmb/docs/grib2/grib2_doc/grib2_table4-211.shtml
  """

  @type id :: integer()
  @type t ::
          :high_bypass
          | :low_bypass
          | :non_bypass
          | :reserved
          | :reserved_for_local_use
          | :missing

  @spec get(id()) :: t()
  def get(0), do: :low_bypass
  def get(1), do: :high_bypass
  def get(2), do: :non_bypass
  def get(n) when n >= 3 and n <= 191, do: :reserved
  def get(n) when n >= 192 and n <= 254, do: :reserved_for_local_use
  def get(255), do: :missing
end
