defmodule ExGrib.Grib2.Section5.MatrixCoordinateValueFunctionDefinition do
  @moduledoc """
  Table 5.2

  Matrix coordinate value function definition

  https://www.nco.ncep.noaa.gov/pmb/docs/grib2/grib2_doc/grib2_table5-2.shtml
  """

  @type id :: integer()
  @type t ::
          :explicit_coordinate_values_set
          | :geometric_coordinates_f
          | :linear_coordinates_f
          | :reserved
          | :reserved_for_local_use
          | :missing

  @spec get(id()) :: t()
  def get(0), do: :explicit_coordinate_values_set
  # Linear Coordinates f(1) = C1 f(n) = f(n-1) + C2
  def get(1), do: :linear_coordinates_f
  def get(n) when n >= 2 and n <= 10, do: :reserved
  # Geometric Coordinates f(1) = C1 f(n) = C2 x f(n-1)
  def get(11), do: :geometric_coordinates_f
  def get(n) when n >= 12 and n <= 191, do: :reserved
  def get(n) when n >= 192 and n <= 254, do: :reserved_for_local_use
  def get(255), do: :missing
end
