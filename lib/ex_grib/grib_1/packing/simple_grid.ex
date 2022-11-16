defmodule ExGrib.Grib1.Packing.SimpleGrid do
  @moduledoc """
  """

  alias ExGrib.Grib1.Table8

  defstruct latitude: :not_parsed, longitude: :not_parsed, value: :not_parsed

  def read(%{data: data_definition, grid_definition: grid, product_definition: product}) do
    Enum.with_index(data_definition.data, fn raw_value, index ->
      %__MODULE__{
        calculate_coordinates(index, grid.grid_definition)
        | value: transform(raw_value, data_definition, product)
      }
    end)
  end

  defp calculate_coordinates(index, %{} = grid_definition) do
    %__MODULE__{
      latitude: calculate_latitude(index, grid_definition),
      longitude: calculate_longitude(index, grid_definition)
    }
  end

  # i is west to east
  # j is south to north
  #
  # with consecutive points i each row and no reversed rows
  # each point is thus consecutive longitude, with each "row"
  # being a single latitude
  #
  # TODO: only works for even grids currently, no stretching

  defp calculate_latitude(index, %{
         i_direction_increment: increment,
         latitude_of_first_grid_point: lat,
         ni: nij,
         nj: nij,
         scanning_mode: %Table8{
           consecutive_points: :i,
           i_direction: :positive,
           j_direction: :positive
         }
       }) do
    # row number n is given by index divided by the number
    # in each row rounded down
    n = floor(index / nij)
    lat + n * increment
  end

  defp calculate_longitude(index, %{
         j_direction_increment: increment,
         longitude_of_first_grid_point: lon,
         ni: nij,
         nj: nij,
         scanning_mode: %Table8{
           consecutive_points: :i,
           i_direction: :positive,
           j_direction: :positive
         }
       }) do
    # position in row is given by the index
    # minus the amount in previous rows, which
    # in turn is row number multiplied by amount in each row
    n = index - floor(index / nij) * nij
    lon + n * increment
  end

  defp transform(<<0b111111, _::integer-size(10)>>, %{data_flag: %{int_or_float: :float}}, _),
    do: :infinity

  defp transform(<<0b011111, _::integer-size(10)>>, %{data_flag: %{int_or_float: :float}}, _),
    do: :nan

  # The actual value Y (in the units of Code table 2) is linked to the coded value X,
  # the reference value R, the binary scale factor E and the decimal scale factor D by means of the following formula:
  #
  # Y × 10D = R + X × 2^E
  defp transform(
         raw,
         %{
           bits_per_value: n,
           reference_value: raw_r,
           data_flag: %{int_or_float: int_or_float},
           binary_scale_factor: e
         },
         %{
           decimal_scale_factor: d
         }
       ) do
    <<x::integer-size(n)-unit(1)>> = raw

    r =
      case int_or_float do
        :int -> round(raw_r)
        :float -> raw_r
      end

    y_10d = r + x * 2.0 ** e
    y_10d / 10 ** d
  end
end
