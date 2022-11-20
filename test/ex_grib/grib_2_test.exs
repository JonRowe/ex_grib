defmodule ExGrib.Grib2Test do
  use ExUnit.Case

  alias ExGrib.Grib2
  alias ExGrib.Grib2.Section0
  alias ExGrib.Grib2.Section1
  alias ExGrib.Grib2.Section3
  alias ExGrib.Grib2.Section4
  alias ExGrib.Grib2.Section5
  alias ExGrib.Grib2.Section6
  alias ExGrib.Grib2.Section7
  alias ExGrib.Grib2.Section3.Templates.LatitudeLongitude
  alias ExGrib.Grib2.Section4.Templates.AnalysisOrForecast
  alias ExGrib.Grib2.Section5.Templates.GridPointDataSimplePacking

  import ExGrib.Test.File, only: [file_contents: 1, file_contents: 2]

  doctest ExGrib.Grib2

  describe "detect/1" do
    test "it returns true when binary contains a grib2 header" do
      assert true == Grib2.detect(file_contents("gfs_25km.grb2"))
    end

    test "it returns false otherwise" do
      assert false == Grib2.detect(<<"GRIB", 0, 0, 0, 1>>)
    end
  end

  describe "bitmap/1" do
    test "it returns bitmap data" do
      assert {:ok, %Section6{bit_map_data: "bitmap", bit_map_indicator: :bit_map_attached},
              "rest"} = Grib2.bitmap(<<0, 0, 0, 12, 6, 0, "bitmap", "rest">>)
    end

    test "a grib with no bitmap will skip the bitmap data" do
      assert {:ok, %Section6{bit_map_data: :none, bit_map_indicator: :bit_map_does_not_apply}, _} =
               Grib2.bitmap(file_contents("gfs_25km.grb2", skip: [octets: 164]))
    end

    test "it errors on an unrecognised section" do
      assert :error = Grib2.bitmap(<<"NOTAGRIB">>)
    end
  end

  describe "data/1" do
    test "it returns data" do
      assert {:ok, %Section7{}, _} =
               Grib2.data(file_contents("gfs_25km.grb2", skip: [octets: 170]))
    end

    test "it errors on an unrecognised section" do
      assert :error = Grib2.data(<<"NOTAGRIB">>)
    end
  end

  describe "footer/1" do
    test "it returns :ok if a valid end of file" do
      assert {:ok, :end_of_file} = Grib2.footer("7777")
    end

    test "it returns {:ok, :more_data, data} if a valid end of grib but not end of file" do
      assert {:ok, :more_data, _} =
               Grib2.footer(file_contents("gfs_25km.grb2", skip: [octets: 184]))
    end

    test "it errors on an unrecognised section" do
      assert :error = Grib2.footer(<<"NOTAGRIB">>)
    end
  end

  describe "parse/1" do
    test "it pulls out a grib" do
      assert {:ok, %Grib2{} = grib, _more_data} = Grib2.parse(file_contents("gfs_25km.grb2"))

      assert %Grib2{
               section_0: %Section0{discipline: :meteorological, file_size: 188},
               section_1: %Section1{} = section_1,
               section_2: :not_present,
               section_3: section_3,
               section_4: section_4,
               section_5: section_5,
               bitmap: %Section6{bit_map_data: :none, bit_map_indicator: :bit_map_does_not_apply},
               data: %Section7{}
             } = grib

      assert %Section1{
               centre: :us_national_weather_service_ncep_wmc,
               sub_centre: :unknown,
               local_version: 1,
               significance_of_reference_time: :start_of_forecast,
               year: 2021,
               month: 12,
               day: 12,
               hour: 12,
               minute: 0,
               second: 0,
               production_status: :operational_products,
               type: :forecast_products
             } == section_1

      assert %Section3{
               interpetation_of_optional_list: :no_attached_list,
               number_of_data_points: 9,
               optional_list: "",
               source: :grib_template,
               template: %LatitudeLongitude{} = section_3_template
             } = section_3

      assert %LatitudeLongitude{
               basic_angle: 0,
               basic_angle_subdivisions: 0,
               d_i: 250_000,
               d_j: 250_000,
               first_point_latitude: 51_000_000,
               first_point_longitude: 358_500_000,
               last_point_latitude: 50_500_000,
               last_point_longitude: 359_000_000,
               major_axis_scale_factor: 0,
               major_axis_scale_value: 0,
               minor_axis_scale_factor: 0,
               minor_axis_scale_value: 0,
               n_i: 3,
               n_j: 3,
               radius_scale_factor: 0,
               radius_scale_value: 0,
               resolution_and_component_flag: 48,
               scanning_mode: :error,
               shape_of_the_earth: :spherical_2
             } = section_3_template

      assert %Section4{
               number_of_coordinate_values: 0,
               optional_list: "",
               template: %AnalysisOrForecast{} = section_4_template
             } = section_4

      assert %AnalysisOrForecast{
               analysis_or_forecast_generating_process_identified: 96,
               background_generating_process_identifier: 0,
               forecast_time_in_units_defined_by_octet: 0,
               hours_of_observational_data_cutoff_after_reference_time: 0,
               indicator_of_unit_of_time_range: 1,
               minutes_of_observational_data_cutoff_after_reference_time: 0,
               parameter_category: 2,
               parameter_number: 2,
               scale_factor_of_first_fixed_surface: 0,
               scale_factor_of_second_fixed_surface: 0,
               scaled_value_of_first_fixed_surface: 10,
               scaled_value_of_second_fixed_surfaces: 0,
               type_of_first_fixed_surface: 103,
               type_of_generating_process: 2,
               type_of_second_fixed_surfaced: 255
             } == section_4_template

      assert %Section5{
               number_of_data_points_with_values_in_section_7: 9,
               template: %GridPointDataSimplePacking{} = section_5_template
             } = section_5

      assert %GridPointDataSimplePacking{
               binary_scale_factor: 32773,
               decimal_scale_factor: 0,
               number_of_packing_bits: 8,
               reference_value: 1_078_565_273,
               type_of_original_field_values: 0
             } == section_5_template
    end
  end
end
