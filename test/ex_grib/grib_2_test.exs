defmodule ExGrib.Grib2Test do
  use ExUnit.Case

  alias ExGrib.Grib2
  alias ExGrib.Grib2.Section3.Templates.LatitudeLongitude
  alias ExGrib.Grib2.Section4.Templates.AnalysisOrForecast

  import ExGrib.Test.File, only: [file_contents: 1]

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
      {:ok, _, _, rest} = Grib2.header(file_contents("gfs_25km.grb2"))

      {:ok, 21, 1, _, :unknown, 1, _, 2021, 12, 12, 12, 0, 0, _, _, _} =
        Grib2.identification(rest)
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
      {:ok, _, _, next} = Grib2.header(file_contents("gfs_25km.grb2"))
      {:ok, _, _, _, _, _, _, _, _, _, _, _, _, _, _, rest} = Grib2.identification(next)
      {:ok, ^rest} = Grib2.local_use(rest)
    end

    test "it errors on an unrecognised section" do
      assert :error = Grib2.local_use(<<"NOTAGRIB">>)
    end
  end

  describe "grid_definition/1" do
    test "it returns grib definition data" do
      {:ok, _, _, next} = Grib2.header(file_contents("gfs_25km.grb2"))
      {:ok, _, _, _, _, _, _, _, _, _, _, _, _, _, _, next} = Grib2.identification(next)
      {:ok, rest} = Grib2.local_use(next)

      {:ok, :grib_template, 9, :no_attached_list, %LatitudeLongitude{} = template, "", _} =
        Grib2.grid_definition(rest)

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
      {:ok, _, _, next} = Grib2.header(file_contents("gfs_25km.grb2"))
      {:ok, _, _, _, _, _, _, _, _, _, _, _, _, _, _, next} = Grib2.identification(next)
      {:ok, next} = Grib2.local_use(next)
      {:ok, _, _, _, _, _, next} = Grib2.grid_definition(next)

      assert {:ok, 0, template, "", _} = Grib2.product_definition(next)

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
end
