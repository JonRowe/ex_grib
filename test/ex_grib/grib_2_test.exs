defmodule ExGrib.Grib2Test do
  use ExUnit.Case

  alias ExGrib.Grib2
  alias ExGrib.Grib2.Section3.Templates.LatitudeLongitude
  alias ExGrib.Grib2.Section4.Templates.AnalysisOrForecast
  alias ExGrib.Grib2.Section5.Templates.GridPointDataSimplePacking

  import ExGrib.Test.File, only: [file_contents: 1, file_contents: 2]

  doctest ExGrib.Grib2

  describe "header/1" do
    test "it returns the header of the grib" do
      assert {:ok, :meteorological, 188, _} = Grib2.header(file_contents("gfs_25km.grb2"))
    end

    test "it errors on unrecognised headers" do
      assert :error = Grib2.header(<<"NOTAGRIB">>)
    end
  end

  describe "identification/1" do
    test "it returns the identification details of the grib" do
      {:ok, 21, 1, _, :unknown, 1, _, 2021, 12, 12, 12, 0, 0, _, _, _} =
        Grib2.identification(file_contents("gfs_25km.grb2", skip: [octets: 16]))
    end

    test "it errors on an unrecognised section" do
      assert :error = Grib2.identification(<<"NOTAGRIB">>)
    end
  end

  describe "local_use/1" do
    test "it skips the local use section" do
      assert {:ok, "NEXT"} = Grib2.local_use(<<0, 0, 0, 10, 2, "LOCAL", "NEXT">>)
    end

    test "it works with our sample file" do
      file = file_contents("gfs_25km.grb2", skip: [octets: 37])
      {:ok, ^file} = Grib2.local_use(file)
    end

    test "it errors on an unrecognised section" do
      assert :error = Grib2.local_use(<<"NOTAGRIB">>)
    end
  end

  describe "grid_definition/1" do
    test "it returns grib definition data" do
      {:ok, :grib_template, 9, :no_attached_list, %LatitudeLongitude{} = template, "", _} =
        Grib2.grid_definition(file_contents("gfs_25km.grb2", skip: [octets: 37]))

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
             } = template
    end

    test "it errors on an unrecognised section" do
      assert :error = Grib2.grid_definition(<<"NOTAGRIB">>)
    end
  end

  describe "product_definition/1" do
    test "it returns production definition data" do
      assert {:ok, 0, template, "", _} =
               Grib2.product_definition(file_contents("gfs_25km.grb2", skip: [octets: 109]))

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
             } == template
    end

    test "it errors on an unrecognised section" do
      assert :error = Grib2.product_definition(<<"NOTAGRIB">>)
    end
  end

  describe "data_representation/1" do
    test "it returns data representation data" do
      assert {:ok, 9, template, _} =
               Grib2.data_representation(file_contents("gfs_25km.grb2", skip: [octets: 143]))

      assert %GridPointDataSimplePacking{
               binary_scale_factor: 32773,
               decimal_scale_factor: 0,
               number_of_packing_bits: 8,
               reference_value: 1_078_565_273,
               type_of_original_field_values: 0
             } == template
    end

    test "it errors on an unrecognised section" do
      assert :error = Grib2.data_representation(<<"NOTAGRIB">>)
    end
  end

  describe "bitmap/1" do
    test "it returns bitmap data" do
      assert {:ok, :bit_map_attached, "bitmap", "rest"} =
               Grib2.bitmap(<<0, 0, 0, 12, 6, 0, "bitmap", "rest">>)
    end

    test "a grib with no bitmap will skip the bitmap data" do
      assert {:ok, :bit_map_does_not_apply, _} =
               Grib2.bitmap(file_contents("gfs_25km.grb2", skip: [octets: 164]))
    end

    test "it errors on an unrecognised section" do
      assert :error = Grib2.bitmap(<<"NOTAGRIB">>)
    end
  end

  describe "data/1" do
    test "it returns data" do
      assert {:ok, _, _} = Grib2.data(file_contents("gfs_25km.grb2", skip: [octets: 170]))
    end

    test "it errors on an unrecognised section" do
      assert :error = Grib2.data(<<"NOTAGRIB">>)
    end
  end

  describe "footer/1" do
    test "it returns :ok if a valid end of file" do
      assert {:ok, :more_data, _} =
               Grib2.footer(file_contents("gfs_25km.grb2", skip: [octets: 184]))
    end

    test "it errors on an unrecognised section" do
      assert :error = Grib2.footer(<<"NOTAGRIB">>)
    end
  end
end
