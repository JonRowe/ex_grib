defmodule ExGrib.Grib2.Section3.TypeOfHorizontalLine do
  @moduledoc """
  Table 3.20

  https://www.nco.ncep.noaa.gov/pmb/docs/grib2/grib2_doc/grib2_table3-20.shtml
  """

  @type input :: integer()
  @type t :: :rhumb | :great_circle | :reserved | :reserved_for_local_use | :missing

  @spec get(input()) :: t()
  def get(0), do: :rhumb
  def get(1), do: :great_circle
  def get(n) when n >= 2 and n <= 191, do: :reserved
  def get(n) when n >= 192 and n <= 254, do: :reserved_for_local_use
  def get(255), do: :missing
end
