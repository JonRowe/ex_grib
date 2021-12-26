defmodule ExGrib.Grib2.Section3.ProjectionCentre do
  @moduledoc """
  Table 3.5

  Represents the centre of a projection.

  https://www.nco.ncep.noaa.gov/pmb/docs/grib2/grib2_doc/grib2_table3-5.shtml
  """

  @type input :: binary()
  @type t :: {:north_pole | :south_pole, :single_pole | :bi_pole_symmetric} | :error

  @spec get(input()) :: t()
  def get(<<bit_1::integer-size(1), bit_2::integer-size(1), _::integer-size(6)>>),
    do: {pole(bit_1), centre(bit_2)}

  def get(_), do: :error

  # 0 - North Pole is on the projection plane
  # 1 - South Pole is on the projection plane
  defp pole(0), do: :north_pole
  defp pole(1), do: :south_pole

  # 0 - Only one projection center is used
  # 1 - Projection is bi-polar and symmetric
  defp centre(0), do: :single_pole
  defp centre(1), do: :bi_pole_symmetric
end
