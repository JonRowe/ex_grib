defmodule ExGrib.Grib2.Section4.QualityIndicator do
  @moduledoc """
  Table 4.244

  Quality indicator

  https://www.nco.ncep.noaa.gov/pmb/docs/grib2/grib2_doc/grib2_table4-244.shtml
  """

  @type id :: integer()
  @type t ::
          :failed
          | :no_quality_information_available
          | :passed
          | :reserved
          | :reserved_for_local_use
          | :missing

  @spec get(id()) :: t()
  def get(0), do: :no_quality_information_available
  def get(1), do: :failed
  def get(2), do: :passed
  def get(n) when n >= 3 and n <= 191, do: :reserved
  def get(n) when n >= 192 and n <= 254, do: :reserved_for_local_use
  def get(255), do: :missing
end
