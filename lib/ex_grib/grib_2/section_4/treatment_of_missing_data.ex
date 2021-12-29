defmodule ExGrib.Grib2.Section4.TreatmentOfMissingData do
  @moduledoc """
  Table 4.221

  Treatment of missing data

  https://www.nco.ncep.noaa.gov/pmb/docs/grib2/grib2_doc/grib2_table4-221.shtml
  """

  @type id :: integer()
  @type t ::
          :extrapolated
          | :not_included
          | :reserved
          | :reserved_for_local_use
          | :missing

  @spec get(id()) :: t()
  def get(0), do: :not_included
  def get(1), do: :extrapolated
  def get(n) when n >= 2 and n <= 191, do: :reserved
  def get(n) when n >= 192 and n <= 254, do: :reserved_for_local_use
  def get(255), do: :missing
end
