defmodule ExGrib.Grib2.Section5.OrderOfSpatialDifferencing do
  @moduledoc """
  Table 5.6

  Order of spatial differencing

  https://www.nco.ncep.noaa.gov/pmb/docs/grib2/grib2_doc/grib2_table5-6.shtml
  """

  @type id :: integer()
  @type t ::
          :first_order_spatial_differencing
          | :second_order_spatial_differencing
          | :reserved
          | :reserved_for_local_use
          | :missing

  @spec get(id()) :: t()
  def get(0), do: :reserved
  def get(1), do: :first_order_spatial_differencing
  def get(2), do: :second_order_spatial_differencing
  def get(n) when n >= 3 and n <= 191, do: :reserved
  def get(n) when n >= 192 and n <= 254, do: :reserved_for_local_use
  def get(255), do: :missing
end
