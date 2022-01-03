defmodule ExGrib.Grib2.Section5.TypeOfOriginalFieldValues do
  @moduledoc """
  Table 5.1

  Type of original field values

  https://www.nco.ncep.noaa.gov/pmb/docs/grib2/grib2_doc/grib2_table5-1.shtml
  """

  @type id :: integer()
  @type t ::
          :floating_point
          | :integer
          | :reserved
          | :reserved_for_local_use
          | :missing

  @spec get(id()) :: t()
  def get(0), do: :floating_point
  def get(1), do: :integer
  def get(n) when n >= 2 and n <= 191, do: :reserved
  def get(n) when n >= 192 and n <= 254, do: :reserved_for_local_use
  def get(255), do: :missing
end
