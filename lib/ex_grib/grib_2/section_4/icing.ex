defmodule ExGrib.Grib2.Section4.Icing do
  @moduledoc """
  Table 4.207

  Icing

  https://www.nco.ncep.noaa.gov/pmb/docs/grib2/grib2_doc/grib2_table4-207.shtml
  """

  @type id :: integer()
  @type t ::
          :heavy
          | :light
          | :moderate
          | :none
          | :severe
          | :trace
          | :reserved
          | :reserved_for_local_use
          | :missing

  @spec get(id()) :: t()
  def get(0), do: :none
  def get(1), do: :light
  def get(2), do: :moderate
  def get(3), do: :severe
  def get(4), do: :trace
  def get(5), do: :heavy
  def get(n) when n >= 6 and n <= 191, do: :reserved
  def get(n) when n >= 192 and n <= 254, do: :reserved_for_local_use
  def get(255), do: :missing
end
