defmodule ExGrib.Grib2.Section3.ScanningMode do
  @moduledoc """
  Table 3.4

  Information on how to scan the binary data.

  https://www.nco.ncep.noaa.gov/pmb/docs/grib2/grib2_doc/grib2_table3-4.shtml
  """

  defstruct i_direction: nil,
            j_direction: nil,
            consecutive_point_direction: nil,
            consecutive_rows_scan_direction: nil,
            odd_row_x_offset: nil,
            even_row_x_offset: nil,
            y_offset: nil,
            row_points: :ni,
            column_points: :nj

  @typep direction :: :positive | :negative

  @typep scanning_direction ::
           %__MODULE__{
             i_direction: direction(),
             j_direction: direction(),
             consecutive_point_direction: :i | :j,
             consecutive_rows_scan_direction: :same | :opposite,
             odd_row_x_offset: boolean(),
             even_row_x_offset: boolean(),
             y_offset: boolean(),
             row_points: :ni | :ni_minus_one,
             column_points: :nj | :nj_minus_one
           }

  @type input :: binary()
  @type t :: {:ok, scanning_direction()} | :error

  # direction(), direction(), :i_consecutive | :j_consecutive, :rows_scan_same_direction | :rows_scan_opposite_direction}

  @spec get(input()) :: t()
  def get(
        <<bit_1::integer-size(1), bit_2::integer-size(1), bit_3::integer-size(1),
          bit_4::integer-size(1), bit_5::integer-size(1), bit_6::integer-size(1),
          bit_7::integer-size(1), bit_8::integer-size(1)>>
      ) do
    finalise(
      %__MODULE__{
        i_direction: direction(bit_1),
        j_direction: direction(bit_2),
        consecutive_point_direction: point_direction(bit_3),
        consecutive_rows_scan_direction: scan_direction(bit_4),
        odd_row_x_offset: row_offset(bit_5),
        even_row_x_offset: row_offset(bit_6),
        y_offset: row_offset(bit_7)
      },
      bit_8
    )
  end

  def get(_), do: :error

  # Bit 1/2 are i / j direction
  defp direction(0), do: :positive
  defp direction(1), do: :negative

  # Bit 3
  # 0 Adjacent points in the i (x) direction are consecutive
  # 1 Adjacent points in the j (y) direction are consecutive
  defp point_direction(0), do: :i
  defp point_direction(1), do: :j

  # Bit 4
  # 0 All rows scan in the same direction
  # 1 Adjacent rows scan in the opposite direction
  defp scan_direction(0), do: :same
  defp scan_direction(1), do: :opposite

  # Bit 5
  # 0 - Points within odd rows are not offset in i(x) direction
  # 1 - Points within odd rows are offset by Di/2 in i(x) direction
  # Bit 6
  # 0 - Points within even rows are not offset in i(x) direction
  # 1 - Points within even rows are offset by Di/2 in i(x) direction
  # Bit 7
  # 0 - Points are not offset in j(y) direction
  # 1 - Points are offset by Dj/2 in j(y) direction
  defp row_offset(0), do: false
  defp row_offset(1), do: true

  # Bit 8
  # 0 - Rows have Ni grid points and columns have Nj grid points
  # 1 - Rows have Ni grid points if points are not offset in i direction
  #     Rows have Ni-1 grid points if points are offset by Di/2 in i direction
  #     Columns have Nj grid points if points are not offset in j direction
  #     Columns have Nj-1 grid points if points are offset by Dj/2 in j direction
  defp finalise(info, 0), do: {:ok, %__MODULE__{info | row_points: :ni, column_points: :nj}}

  defp finalise(info, 1),
    do:
      {:ok, %__MODULE__{info | row_points: row_points(info), column_points: column_points(info)}}

  defp column_points(%__MODULE__{y_offset: true}), do: :nj_minus_one
  defp column_points(_), do: :nj

  defp row_points(%__MODULE__{even_row_x_offset: true}), do: :ni_minus_one
  defp row_points(%__MODULE__{odd_row_x_offset: true}), do: :ni_minus_one
  defp row_points(_), do: :ni
end
