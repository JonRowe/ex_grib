defmodule ExGrib.Grib2.Section5.MatrixCoordinateParameter do
  @moduledoc """
  Table 5.3

  Matrix coordinate parameter

  https://www.nco.ncep.noaa.gov/pmb/docs/grib2/grib2_doc/grib2_table5-3.shtml
  """

  @type id :: integer()
  @type t ::
          :direction_degrees_true
          | :frequency
          | :radial_number
          | :reserved
          | :reserved_for_local_use
          | :missing

  @spec get(id()) :: t()
  def get(0), do: :reserved
  def get(1), do: :direction_degrees_true
  # Frequency (s-1)
  def get(2), do: :frequency
  # Radial Number (2pi lamda) (m-1)
  def get(3), do: :radial_number
  def get(n) when n >= 4 and n <= 191, do: :reserved
  def get(n) when n >= 192 and n <= 254, do: :reserved_for_local_use
  def get(255), do: :missing
end
