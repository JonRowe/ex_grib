defmodule ExGrib.Grib2.Section3Test do
  use ExUnit.Case, async: true

  alias ExGrib.Grib2.Section3
  alias ExGrib.Grib2.Section3.Templates.LatitudeLongitude

  import ExGrib.Test.File, only: [file_contents: 2]

  describe "parse/1" do
    test "it returns grib definition data" do
      assert {:ok, section, _} =
               Section3.parse(file_contents("gfs_25km.grb2", skip: [octets: 37]))

      assert %Section3{
               interpetation_of_optional_list: :no_attached_list,
               number_of_data_points: 9,
               optional_list: "",
               source: :grib_template,
               template: %LatitudeLongitude{} = template
             } = section

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
      assert :error = Section3.parse(<<"NOTAGRIB">>)
    end
  end
end
