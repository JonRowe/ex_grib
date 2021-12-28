defmodule ExGrib.Grib2.Section3.GridPointPosition do
  @moduledoc """
  Table 3.8

  Defines the location of grid points.

  https://www.nco.ncep.noaa.gov/pmb/docs/grib2/grib2_doc/grib2_table3-8.shtml
  """

  @type input :: integer()
  @type t :: :vertice | :centre | :midpoint | :reserved | :reserved_for_local_use | :missing

  @spec get(input()) :: t()
  def get(0), do: :vertice
  def get(1), do: :centre
  def get(2), do: :midpoint
  def get(n) when n >= 3 and n <= 191, do: :reserved
  def get(n) when n >= 192 and n <= 254, do: :reserved_for_local_use
  def get(255), do: :missing
end
