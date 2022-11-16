defmodule ExGrib.Grib1.Section2Test do
  use ExUnit.Case, async: true

  doctest ExGrib.Grib1.Section2

  alias ExGrib.Grib1.Grids.LatitudeLongitudeGrid
  alias ExGrib.Grib1.Section2
  alias ExGrib.Grib1.Table8

  import ExGrib.Test.File, only: [file_contents: 2]

  describe "parse/1" do
    test "it returns grib definition data" do
      assert {:ok, section, _} = Section2.parse(file_contents("forecast.grb", skip: [octets: 36]))

      assert %Section2{
               data_representation_type: :latitude_longitude_grid,
               grid_definition: %LatitudeLongitudeGrid{
                 i_direction_increment: 100,
                 j_direction_increment: 100,
                 latitude_of_first_grid_point: 47210,
                 latitude_of_last_grid_point: 53210,
                 longitude_of_first_grid_point: -7346,
                 longitude_of_last_grid_point: -1346,
                 ni: 61,
                 nj: 61,
                 resolution_and_component_flags: 128,
                 scanning_mode: %Table8{
                   consecutive_points: :i,
                   i_direction: :positive,
                   j_direction: :positive
                 }
               },
               grid_definition_extension: :not_parsed,
               number_of_vertical_coordinate_values: 0,
               pl: :not_parsed,
               pv: :not_parsed,
               pvl_location: 255,
               section_length: 32
             } = section
    end

    test "it errors on an unrecognised section" do
      assert :error = Section2.parse(<<"NOTAGRIB">>)
    end
  end
end
