defmodule ExGrib.Grib2.Section4.IcingScenario do
  @moduledoc """
  Table 4.227

  Icing scenario (weather/cloud classification)

  https://www.nco.ncep.noaa.gov/pmb/docs/grib2/grib2_doc/grib2_table4-227.shtml
  """

  @type id :: integer()
  @type t ::
          :convective
          | :freezing
          | :general
          | :none
          | :stratiform
          | :reserved
          | :reserved_for_local_use
          | :missing

  @spec get(id()) :: t()
  def get(0), do: :none
  def get(1), do: :general
  def get(2), do: :convective
  def get(3), do: :stratiform
  def get(4), do: :freezing
  def get(n) when n >= 5 and n <= 191, do: :reserved
  def get(n) when n >= 192 and n <= 254, do: :reserved_for_local_use
  def get(255), do: :missing
end
