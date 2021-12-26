defmodule ExGrib.Grib2.Section3.ScanningModeForOneDiamond do
  @moduledoc """
  Table 3.10
  Scanning mode for one diamond.

  https://www.nco.ncep.noaa.gov/pmb/docs/grib2/grib2_doc/grib2_table3-10.shtml
  """

  @type input :: binary()
  @type t ::
          {:ok, :pole_to_equator | :equator_to_pole, :west_to_east | :east_to_west, :i | :j}
          | :error

  @spec get(input()) :: t()
  def get(<<
        bit_1::integer-size(1),
        bit_2::integer-size(1),
        bit_3::integer-size(1),
        _::bits-size(5)
      >>) do
    {:ok, latitude_scan_direction(bit_1), longitude_scan_direction(bit_2), adjacent_points(bit_3)}
  end

  def get(_), do: :error

  # bit 1 - i / latitude scan direction
  # 0 - Points  scan in the +i direction, i.e. from pole to Equator
  # 1 - Points scan in the -i direction, i.e. from Equator to pole
  defp latitude_scan_direction(0), do: :pole_to_equator
  defp latitude_scan_direction(1), do: :equator_to_pole

  # bit 2
  # 0 - Points scan in the +j direction, i.e. from west to east
  # 1 - Points scan in the -j direction, i.e. from east to west
  defp longitude_scan_direction(0), do: :west_to_east
  defp longitude_scan_direction(1), do: :east_to_west

  # bit 3
  # 0 - Adjacent points in the i direction are consecutive
  # 1 - Adjacent points in the j direction are consecutive
  defp adjacent_points(0), do: :i
  defp adjacent_points(1), do: :j
end
