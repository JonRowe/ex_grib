defmodule ExGrib.Grib2.Section4.ClutterFilterIndicator do
  @moduledoc """
  Table 4.14

  Clutter filter indicator

  https://www.nco.ncep.noaa.gov/pmb/docs/grib2/grib2_doc/grib2_table4-14.shtml
  """

  @type id :: integer()
  @type t ::
          :clutter_filter_used
          | :no_clutter_filter_used
          | :reserved
          | :reserved_for_local_use
          | :missing

  @spec get(id()) :: t()
  def get(0), do: :no_clutter_filter_used
  def get(1), do: :clutter_filter_used
  def get(n) when n >= 2 and n <= 191, do: :reserved
  def get(n) when n >= 192 and n <= 254, do: :reserved_for_local_use
  def get(255), do: :missing
end
