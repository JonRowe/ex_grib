defmodule ExGrib.Grib1Test do
  use ExUnit.Case, async: true

  alias ExGrib.Grib1
  alias ExGrib.Grib1.Grids.LatitudeLongitudeGrid
  alias ExGrib.Grib1.Section0
  alias ExGrib.Grib1.Section1
  alias ExGrib.Grib1.Section2
  alias ExGrib.Grib1.Section4
  alias ExGrib.Grib1.Table1
  alias ExGrib.Grib1.Table2
  alias ExGrib.Grib1.Table3
  alias ExGrib.Grib1.Table8
  alias ExGrib.Grib1.Table11

  import ExGrib.Test.File, only: [file_contents: 1, file_contents: 2]

  doctest ExGrib.Grib1

  describe "detect/1" do
    test "it returns true when binary contains a grib1 header" do
      assert true == Grib1.detect(file_contents("forecast.grb"))
    end

    test "it returns false otherwise" do
      assert false == Grib1.detect(file_contents("gfs_25km.grb2"))
    end
  end

  describe "generate_grid/1" do
    test "it assigns values to latitude / longitude" do
      assert {:ok, message, _} =
               Grib1.parse(file_contents("forecast.grb", skip: [octets: 180_272]), read_data: true)

      # assert we've found the right message
      assert message.section_1.indicator_of_parameter == %Table2{
               parameter: :temperature,
               unit: :k
             }

      assert message.section_1.indicator_of_type_of_level == %Table3{
               octet_10: :specified_height_level_above_ground,
               octet_11: :height_in_metres,
               octet_12: :continue
             }

      assert message.section_1.level == 2
      assert message.section_1.p1 == 720

      [["Latitude", "Longitude", "Value"] | expected_data] =
        file_contents("forecast_temperatures.csv", parse: :csv)

      parsed_data =
        Enum.map(
          Grib1.generate_grid(message),
          &[&1.latitude / 1000, &1.longitude / 1000, &1.value]
        )

      assert Enum.sort(parsed_data) == Enum.sort(expected_data)
    end
  end

  describe "index/2" do
    test "it returns the index for a latitude / longitude pair" do
      assert {:ok, message, _} = Grib1.parse(file_contents("forecast.grb"), read_data: true)
      assert Grib1.index(message, 49910, -5946) == 1661
    end

    test "it will return nearest? index for a slightly miss matched latitude / longitude pair" do
      assert {:ok, message, _} = Grib1.parse(file_contents("forecast.grb"), read_data: true)
      assert Grib1.index(message, 49950, -5950) == 1660
      assert Grib1.index(message, 49950, -5940) == 1661
    end
  end

  describe "matches?/2" do
    @height :specified_height_level_above_ground

    test "it returns true when all query parts match the grib" do
      assert {:ok, message, _} =
               Grib1.parse(file_contents("forecast.grb", skip: [octets: 180_272]),
                 read_data: false
               )

      assert Grib1.matches?(message, parameter: :temperature)
      assert Grib1.matches?(message, parameter: :temperature, unit: :k)
      assert Grib1.matches?(message, parameter: :temperature, level: 2)
      assert Grib1.matches?(message, parameter: :temperature, type_of_level: @height)
      assert Grib1.matches?(message, parameter: :temperature, unit: :k, level: 2)
      assert Grib1.matches?(message, parameter: :temperature, type_of_level: @height, unit: :k)
      assert Grib1.matches?(message, parameter: :temperature, type_of_level: @height, level: 2)

      assert Grib1.matches?(message,
               parameter: :temperature,
               type_of_level: @height,
               level: 2,
               unit: :k
             )

      refute Grib1.matches?(message, parameter: :u_component_of_wind)
      refute Grib1.matches?(message, parameter: :temperature, unit: :hpa)
      refute Grib1.matches?(message, parameter: :temperature, level: 10)
    end
  end

  describe "matches_forecast_time?/2" do
    test "it returns true when the naivedatetime matches the forecast time" do
      assert {:ok, message, _} =
               Grib1.parse(file_contents("forecast.grb", skip: [octets: 180_272]),
                 read_data: false
               )

      assert Grib1.matches_forecast_time?(message, ~N[2022-05-29 12:00:00])
      refute Grib1.matches_forecast_time?(message, ~N[2022-05-29 11:00:00])
      refute Grib1.matches_forecast_time?(message, ~N[2022-05-29 13:00:00])
      refute Grib1.matches_forecast_time?(message, ~N[2022-05-30 12:00:00])
    end
  end

  describe "parse/1" do
    test "it pulls out a grib" do
      assert {:ok, %Grib1{} = grib, _more_data} =
               Grib1.parse(file_contents("forecast.grb"), read_data: false)

      assert %Grib1{
               section_0: %Section0{file_size: 7526},
               section_1: section_1,
               section_2: section_2,
               section_3: :not_present,
               section_4: section_4
             } = grib

      assert %Section1{
               centre: :missing,
               century_of_reference_time_of_data: 21,
               day: 29,
               decimal_scale_factor: 0,
               generating_process_identifier: 74,
               grid_definition: 255,
               hour: 0,
               indicator_of_parameter: %Table2{parameter: :pressure_reduced_to_msl, unit: :pa},
               indicator_of_type_of_level: %Table3{
                 octet_10: :mean_sea_level,
                 octet_11: :not_set,
                 octet_12: :not_set
               },
               level: 0,
               minute: 0,
               month: 5,
               number_included_in_average: 0,
               number_missing_from_averages_or_accumulations: 0,
               p1: 180,
               p2: 0,
               section_1_flags: %Table1{section_2: :included, section_3: :ommited},
               section_length: 28,
               sub_centre: :wmo_secretariat,
               table_version: 2,
               time_range_indicator:
                 :forecast_or_uninitialized_analysis_or_image_valid_for_reference_time,
               unit_of_time_range: :minute,
               year_of_century: 22
             } = section_1

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
             } = section_2

      assert %Section4{
               binary_scale_factor: -6,
               bits_per_value: 16,
               data: :not_loaded,
               data_flag: %Table11{
                 additional_flags_at_section_4_octect_14: false,
                 grid_or_sphere: :grid,
                 int_or_float: :float,
                 simple_or_complex: :simple
               },
               reference_value: 101_737.125,
               section_length: 7454
             } = section_4
    end
  end
end
