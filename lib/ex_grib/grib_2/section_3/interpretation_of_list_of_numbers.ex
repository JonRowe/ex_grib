defmodule ExGrib.Grib2.Section3.InterpretationOfListOfNumbers do
  @moduledoc """
  Table 3.11

  Section 3 can contain an attached list of numbers. The meanings of the interpretations are:

  - `0` There is no attached list.
  - `1` Numbers define number of points corresponding to full coordinate circles (i.e. parallels).
    Coordinate values on each circle are multiple of the circle mesh, and extreme coordinate
    values given in grid definition may not be reached in all rows.
  - `2` Numbers define number of points corresponding to coordinate lines delimited by extreme
    coordinate values given in grid definition which are present in each row.
  - `3`	Numbers define the actual latitudes for each row in the grid. The list of numbers are
    integer values of the valid latitudes in microdegrees (scale by 106) or in unit equal to
    the ratio of the basic angle and the subdivisions number for each row, in the same order
    as specified in the "scanning mode flag" (bit no. 2) (see note 2)

  https://www.nco.ncep.noaa.gov/pmb/docs/grib2/grib2_doc/grib2_table3-11.shtml
  """

  @type id :: integer()
  @type t ::
          :no_attached_list
          | :coordinate_circles
          | :coordinate_lines
          | :coordinate_latitudes
          | :reserved
          | :missing

  @spec get(id()) :: t()
  def get(0), do: :no_attached_list
  def get(1), do: :coordinate_circles
  def get(2), do: :coordinate_lines
  def get(3), do: :coordinate_latitudes
  def get(n) when n >= 4 and n <= 254, do: :reserved
  def get(255), do: :missing
end
