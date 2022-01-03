defmodule ExGrib.Grib2.Section5.TypeOfCompression do
  @moduledoc """
  Table 5.40

  Type of compression

  https://www.nco.ncep.noaa.gov/pmb/docs/grib2/grib2_doc/grib2_table5-40.shtml
  """

  @type id :: integer()
  @type t ::
          :lossless
          | :lossy
          | :reserved
          | :missing

  @spec get(id()) :: t()
  def get(0), do: :lossless
  def get(1), do: :lossy
  def get(n) when n >= 2 and n <= 254, do: :reserved
  def get(255), do: :missing
end
