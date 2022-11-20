defmodule ExGrib.Grib2.Section4Test do
  use ExUnit.Case, async: true

  alias ExGrib.Grib2.Section4
  alias ExGrib.Grib2.Section4.Templates.AnalysisOrForecast

  import ExGrib.Test.File, only: [file_contents: 2]

  describe "parse/1" do
    test "it returns production definition data" do
      assert {:ok, section, _} =
               Section4.parse(file_contents("gfs_25km.grb2", skip: [octets: 109]))

      assert %Section4{
               number_of_coordinate_values: 0,
               optional_list: "",
               template: %AnalysisOrForecast{} = template
             } = section

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
      assert :error = Section4.parse(<<"NOTAGRIB">>)
    end
  end
end
