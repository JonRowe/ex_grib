defmodule ExGrib.Grib2.Section5.GroupSplittingMethod do
  @moduledoc """
  Table 5.4

  Group splitting method

  https://www.nco.ncep.noaa.gov/pmb/docs/grib2/grib2_doc/grib2_table5-4.shtml
  """

  @type id :: integer()
  @type t ::
          :general_group_splitting
          | :row_by_row_splitting
          | :reserved
          | :reserved_for_local_use
          | :missing

  @spec get(id()) :: t()
  def get(0), do: :row_by_row_splitting
  def get(1), do: :general_group_splitting
  def get(n) when n >= 2 and n <= 191, do: :reserved
  def get(n) when n >= 192 and n <= 254, do: :reserved_for_local_use
  def get(255), do: :missing
end
