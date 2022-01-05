defmodule ExGrib.Grib2.Section4.Templates.AverageAccumulationAtIntervalsTest do
  use ExUnit.Case, async: true

  alias ExGrib.Grib2.Section4.Templates.AverageAccumulationAtIntervals, as: Template

  # The sample comes from our sample GRIB file, gfs_25km.grb2
  @sample <<1, 8, 2, 0, 96, 0, 0, 0, 1, 0, 0, 0, 2, 1, 0, 0, 0, 0, 0, 255, 0, 0, 0, 0, 0, 7, 229,
            12, 12, 15, 0, 0, 1, 0, 0, 0, 0, 255, 2, 1, 0, 0, 0, 1, 255, 0, 0, 0, 0>>

  test "it parses the sample" do
    assert {:ok, template, ""} = Template.get(@sample)

    assert %Template{
             analysis_or_forecast_generating_process_identified: 96,
             background_generating_process_identifier: 0,
             day: 12,
             forecast_time_in_units_defined_by_octet: 2,
             hour: 15,
             hours_after_reference_time_data_cutoff: 0,
             indicator_of_unit_of_time_range: 1,
             minute: 0,
             minutes_after_reference_time_data_cutoff: 0,
             month: 12,
             more_range_specifications: [],
             n: 1,
             next_innermost_range_specification: nil,
             outermost_range_specification:
               %ExGrib.Grib2.Section4.Templates.AverageAccumulationAtIntervals.TimeRangeSpecification{
                 indicator_of_unit_of_time_for_the_increment: 255,
                 indicator_of_unit_of_time_for_time_range: 1,
                 length_of_the_time_range: 1,
                 statistical_process: 255,
                 time_increment: 0,
                 type_of_time_increment: 2
               },
             parameter_category: 1,
             parameter_number: 8,
             scale_factor_of_first_fixed_surface: 0,
             scale_factor_of_second_fixed_surface: 0,
             scaled_value_of_first_fixed_surface: 0,
             scaled_value_of_second_fixed_surfaces: 0,
             second: 0,
             total_number_of_data_values_missing: 0,
             type_of_first_fixed_surface: 1,
             type_of_generating_process: 2,
             type_of_second_fixed_surfaced: 255,
             year: 2021
           } == template
  end
end
