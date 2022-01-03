defmodule ExGrib.Grib2.Section5.Templates.GridPointDataIeeeFloatingPointData do
  @moduledoc """
  Template 5.4

  Grid point data ieee floating point data

  https://www.nco.ncep.noaa.gov/pmb/docs/grib2/grib2_doc/grib2_temp5-4.shtml
  """

  alias ExGrib.Grib2.Section5.PrecisionOfFloatingPointNumbers, as: Precision

  defstruct precision: nil

  @spec get(binary()) :: no_return
  # Precision (See code  Table 5.7)
  def get(<<precision::integer(), rest::binary()>>) do
    {:ok, %__MODULE__{precision: Precision.get(precision)}, rest}
  end
end
