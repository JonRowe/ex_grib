defmodule ExGrib.Grib1.Grids.LatitudeLongitudeGridTest do
  use ExUnit.Case, async: true

  alias ExGrib.Grib1
  alias ExGrib.Grib1.Grid
  alias ExGrib.Grib1.Grids.LatitudeLongitudeGrid

  import ExGrib.Test.File, only: [file_contents: 1]

  test "it produces the correct latitude / longitude details" do
    assert {:ok, message, _more} = Grib1.parse(file_contents("forecast.grb"))

    assert %LatitudeLongitudeGrid{} = definition = message.section_2.grid_definition

    grid =
      Enum.map(0..3720, fn index ->
        %{
          latitude: Grid.latitude(definition, index),
          longitude: Grid.longitude(definition, index)
        }
      end)

    assert length(grid) == 61 * 61

    # i points should be consecutive 0.1 apart, i is west to east so longitude
    # points should be incrementing.
    assert [
             [
               %{latitude: 47210, longitude: -7346},
               %{latitude: 47210, longitude: -7246},
               %{latitude: 47210, longitude: -7146} | row_1_rest
             ],
             [
               %{latitude: 47310, longitude: -7346},
               %{latitude: 47310, longitude: -7246},
               %{latitude: 47310, longitude: -7146} | row_2_rest
             ]
             | rest
           ] = Enum.chunk_every(grid, 61)

    assert Enum.all?(row_1_rest, &(&1.latitude == 47210))
    assert %{longitude: -1346} = List.last(row_1_rest)

    assert Enum.all?(row_2_rest, &(&1.latitude == 47310))
    assert %{longitude: -1346} = List.last(row_2_rest)

    assert [
             %{latitude: 53210, longitude: -7346},
             %{latitude: 53210, longitude: -7246},
             %{latitude: 53210, longitude: -7146} | last_row_rest
           ] = List.last(rest)

    assert Enum.all?(last_row_rest, &(&1.latitude == 53210))
    assert %{longitude: -1346} = List.last(last_row_rest)
  end
end
