defmodule ExGrib.Grib2.Section4.Templates.CrossSectionOfAveragedOrOtherwiseStatisticallyProcessedAnalysisOrForecastOverARangeOfTime do
  @moduledoc """
  Template 4.1001

  Cross section of averaged or otherwise statistically processed analysis or forecast over a range of time

  Notes:

  (1)Hours greater than 65534 will be coded as 65534.
  (2)An increment of zero means that the statistical processing the result
    of continuous (or near continuous) process, not the processing of a
    number of discrete samples. Examples of such continuous process are
    the temperatures measured by analogue maximum and minimum thermometers
    or thermographs and the rainfall measured by a rain gauge.

  WARNING THIS TEMPLATE WAS AUTOGENERATED AND IS LIKELY INCOMPLETE

  https://www.nco.ncep.noaa.gov/pmb/docs/grib2/grib2_doc/grib2_temp4-1001.shtml
  """

  defstruct parameter_category: nil,
            parameter_number: nil,
            type_of_generating_process: nil,
            background_generating_process_identifier: nil,
            analysis_or_forecast_generating_process_identifier: nil,
            hours_of_observational_data_cutoff_after_reference_time: nil,
            minutes_of_observational_data_cutoff_after_reference_time: nil,
            indicator_of_unit_of_time_range: nil,
            forecast_time_in_units_defined_by_octet: nil,
            total_number_of_data_values_missing_in_the_statistical_process: nil,
            statistical_process_used_to_calculate_the_processed_field_from_the_field_at_each_time_increment_during_the_time_range:
              nil,
            type_of_time_increment_between_successive_fields_used_in_the_statistical_processing:
              nil,
            indicator_of_unit_of_time_range_over_which_statistical_processing: nil,
            length_of_the_time_range_over_which_statistical_processing_is_done_in_units_defined_by_the_previous_octet:
              nil,
            indicator_of_unit_of_time_for_the_increment_between_the_successive_fields_used: nil,
            time_increment_between_successive_fields_in_units_defined_by_the_previous_octet: nil

  @spec get(binary()) :: no_return
  def get(<<
        # Parameter category (see Code Table 4.1)
        parameter_category::integer(),
        # Parameter number (see Code  Table 4.2)
        parameter_number::integer(),
        # Type of generating process (see Code Table 4.3)
        type_of_generating_process::integer(),
        # Background generating process identifier (defined by originating centre)
        background_generating_process_identifier::integer(),
        # Analysis or forecast generating process identifier (see Code ON388 Table A)
        analysis_or_forecast_generating_process_identifier::integer(),
        # Hours of observational data cutoff after reference time (see Note 1)
        hours_of_observational_data_cutoff_after_reference_time::integer-size(16),
        minutes_of_observational_data_cutoff_after_reference_time::integer(),
        # Indicator of unit of time range (see Code  Table 4.4)
        indicator_of_unit_of_time_range::integer(),
        # Forecast time in units defined by octet 18
        forecast_time_in_units_defined_by_octet::integer-size(32),
        # Total number of data values missing in the statistical process 27-38 Specification of the outermost (or only) time range over which statistical processing is done
        total_number_of_data_values_missing_in_the_statistical_process::integer-size(32),
        # Statistical process used to calculate the processed field from the field at each time increment during the time range (see Code Table 4.10)
        statistical_process_used_to_calculate_the_processed_field_from_the_field_at_each_time_increment_during_the_time_range::integer(),
        # Type of time increment between successive fields used in the statistical processing (see Code Table 4.11)
        type_of_time_increment_between_successive_fields_used_in_the_statistical_processing::integer(),
        # Indicator of unit of time range over which statistical processing (see Code Table 4.4)
        indicator_of_unit_of_time_range_over_which_statistical_processing::integer(),
        length_of_the_time_range_over_which_statistical_processing_is_done_in_units_defined_by_the_previous_octet::integer-size(
          32
        ),
        # Indicator of unit of time for the increment between the successive fields used (see Code Table 4.4)
        indicator_of_unit_of_time_for_the_increment_between_the_successive_fields_used::integer(),
        # Time increment between successive fields in units defined by the previous octet (see Note 2)
        time_increment_between_successive_fields_in_units_defined_by_the_previous_octet::integer-size(
          32
        ),
        rest::binary()
      >>) do
    template = %__MODULE__{
      parameter_category: parameter_category,
      parameter_number: parameter_number,
      type_of_generating_process: type_of_generating_process,
      background_generating_process_identifier: background_generating_process_identifier,
      analysis_or_forecast_generating_process_identifier:
        analysis_or_forecast_generating_process_identifier,
      hours_of_observational_data_cutoff_after_reference_time:
        hours_of_observational_data_cutoff_after_reference_time,
      minutes_of_observational_data_cutoff_after_reference_time:
        minutes_of_observational_data_cutoff_after_reference_time,
      indicator_of_unit_of_time_range: indicator_of_unit_of_time_range,
      forecast_time_in_units_defined_by_octet: forecast_time_in_units_defined_by_octet,
      total_number_of_data_values_missing_in_the_statistical_process:
        total_number_of_data_values_missing_in_the_statistical_process,
      statistical_process_used_to_calculate_the_processed_field_from_the_field_at_each_time_increment_during_the_time_range:
        statistical_process_used_to_calculate_the_processed_field_from_the_field_at_each_time_increment_during_the_time_range,
      type_of_time_increment_between_successive_fields_used_in_the_statistical_processing:
        type_of_time_increment_between_successive_fields_used_in_the_statistical_processing,
      indicator_of_unit_of_time_range_over_which_statistical_processing:
        indicator_of_unit_of_time_range_over_which_statistical_processing,
      length_of_the_time_range_over_which_statistical_processing_is_done_in_units_defined_by_the_previous_octet:
        length_of_the_time_range_over_which_statistical_processing_is_done_in_units_defined_by_the_previous_octet,
      indicator_of_unit_of_time_for_the_increment_between_the_successive_fields_used:
        indicator_of_unit_of_time_for_the_increment_between_the_successive_fields_used,
      time_increment_between_successive_fields_in_units_defined_by_the_previous_octet:
        time_increment_between_successive_fields_in_units_defined_by_the_previous_octet
    }

    {:ok, template, rest}
  end
end
