defmodule ExGrib.Grib2.Section4.Templates.AverageAccumulationAtIntervals do
  @moduledoc """
  Template 4.8

  Average accumulation at intervalseme values orother statistically-processed values at a horizontal level orin a horizontal layer in a continuous or non-continuous time interval

  Notes:

  (1)Hours greater than 65534 will be coded as 65534.
  (2)The reference time in section 1 and the forecast time together define
    the beginning of the overall time interval.
  (3)An increment of zero means that the statistical processing the result
    of continuous (or near continuous) process, not the processing of a
    number of discrete samples. Examples of such continuous process are
    the temperatures measured by analogue maximum and minimum thermometers
    or thermographs and the rainfall measured by a rain gauge.
    (4) The reference and forecast times are successively set to their initial
    plus or minus the increment, as defined by the type of time increment
    (one of octets 48,60,72...). For all but the innermost (last) time range,
    the next inner range is then processed using these reference and forecast
    times as the initial reference and forecast time.

  WARNING THIS TEMPLATE WAS AUTOGENERATED AND IS LIKELY INCOMPLETE

  https://www.nco.ncep.noaa.gov/pmb/docs/grib2/grib2_doc/grib2_temp4-8.shtml
  """

  defstruct parameter_category: nil,
            parameter_number: nil,
            type_of_generating_process: nil,
            background_generating_process_identifier: nil,
            analysis_or_forecast_generating_process_identified: nil,
            hours_after_reference_time_data_cutoff: nil,
            minutes_after_reference_time_data_cutoff: nil,
            indicator_of_unit_of_time_range: nil,
            forecast_time_in_units_defined_by_octet: nil,
            type_of_first_fixed_surface: nil,
            scale_factor_of_first_fixed_surface: nil,
            scaled_value_of_first_fixed_surface: nil,
            type_of_second_fixed_surfaced: nil,
            scale_factor_of_second_fixed_surface: nil,
            scaled_value_of_second_fixed_surfaces: nil,
            year: nil,
            month: nil,
            day: nil,
            hour: nil,
            minute: nil,
            second: nil,
            n_number_of_time_ranges_specifications_describing_the_time_intervals_used_to_calculate_the_statistically_processed_field:
              nil,
            total_number_of_data_values_missing_in_statistical_process: nil,
            statistical_process_used_to_calculate_the_processed_field_from_the_field_at_each_time_increment_during_the_time_range:
              nil,
            type_of_time_increment_between_successive_fields_used_in_the_statistical_processing:
              nil,
            indicator_of_unit_of_time_for_time_range_over_which_statistical_processing_is_done:
              nil,
            length_of_the_time_range_over_which_statistical_processing_is_done_in_units_defined_by_the_previous_octet:
              nil,
            indicator_of_unit_of_time_for_the_increment_between_the_successive_fields_used: nil,
            time_increment_between_successive_fields_in_units_defined_by_the_previous_octet: nil,
            as_octets: nil

  @spec get(binary()) :: no_return
  def get(<<
        # Parameter category (see Code Table 4.1)
        parameter_category::integer(),
        # Parameter number (see Code Table 4.2)
        parameter_number::integer(),
        # Type of generating process (see Code Table 4.3)
        type_of_generating_process::integer(),
        # Background generating process identifier (defined by originating centre)
        background_generating_process_identifier::integer(),
        # Analysis or forecast generating process identified (see Code ON388 Table A)
        analysis_or_forecast_generating_process_identified::integer(),
        # Hours after reference time data cutoff (see Note 1)
        hours_after_reference_time_data_cutoff::integer-size(16),
        minutes_after_reference_time_data_cutoff::integer(),
        # Indicator of unit of time range (see Code Table 4.4)
        indicator_of_unit_of_time_range::integer(),
        # Forecast time in units defined by octet 18 (see Note 2)
        forecast_time_in_units_defined_by_octet::integer-size(32),
        # Type of first fixed surface (see Code Table 4.5)
        type_of_first_fixed_surface::integer(),
        scale_factor_of_first_fixed_surface::integer(),
        scaled_value_of_first_fixed_surface::integer-size(32),
        # Type of second fixed surfaced (see Code  Table 4.5)
        type_of_second_fixed_surfaced::integer(),
        scale_factor_of_second_fixed_surface::integer(),
        scaled_value_of_second_fixed_surfaces::integer-size(32),
        # Year  ― Time of end of overall time interval
        year::integer-size(16),
        # Month  ― Time of end of overall time interval
        month::integer(),
        # Day  ― Time of end of overall time interval
        day::integer(),
        # Hour  ― Time of end of overall time interval
        hour::integer(),
        # Minute  ― Time of end of overall time interval
        minute::integer(),
        # Second  ― Time of end of overall time interval
        second::integer(),
        # n ― number of time ranges specifications describing the time intervals used to calculate the statistically-processed field
        n_number_of_time_ranges_specifications_describing_the_time_intervals_used_to_calculate_the_statistically_processed_field::integer(),
        total_number_of_data_values_missing_in_statistical_process::integer-size(32),
        # Statistical process used to calculate the processed field from the field at each time increment during the time range (see Code Table 4.10)
        statistical_process_used_to_calculate_the_processed_field_from_the_field_at_each_time_increment_during_the_time_range::integer(),
        # Type of time increment between successive fields used in the statistical processing (see Code Table 4.11)
        type_of_time_increment_between_successive_fields_used_in_the_statistical_processing::integer(),
        # Indicator of unit of time for time range over which statistical processing is done (see Code Table 4.4)
        indicator_of_unit_of_time_for_time_range_over_which_statistical_processing_is_done::integer(),
        length_of_the_time_range_over_which_statistical_processing_is_done_in_units_defined_by_the_previous_octet::integer-size(
          32
        ),
        # Indicator of unit of time for the increment between the successive fields used (see Code Table 4.4)
        indicator_of_unit_of_time_for_the_increment_between_the_successive_fields_used::integer(),
        # Time increment between successive fields in units defined by the previous octet (see Notes 3 and 4) 
        time_increment_between_successive_fields_in_units_defined_by_the_previous_octet::integer-size(
          32
        ),
        # As octets 47 to 58 next innermost step of processing
        as_octets::integer-size(96),
        # Additional time range specifications included in accordance with the value of n. Contents as octets 47 to 58 repeated as necessary
        rest::binary()
      >>) do
    template = %__MODULE__{
      parameter_category: parameter_category,
      parameter_number: parameter_number,
      type_of_generating_process: type_of_generating_process,
      background_generating_process_identifier: background_generating_process_identifier,
      analysis_or_forecast_generating_process_identified:
        analysis_or_forecast_generating_process_identified,
      hours_after_reference_time_data_cutoff: hours_after_reference_time_data_cutoff,
      minutes_after_reference_time_data_cutoff: minutes_after_reference_time_data_cutoff,
      indicator_of_unit_of_time_range: indicator_of_unit_of_time_range,
      forecast_time_in_units_defined_by_octet: forecast_time_in_units_defined_by_octet,
      type_of_first_fixed_surface: type_of_first_fixed_surface,
      scale_factor_of_first_fixed_surface: scale_factor_of_first_fixed_surface,
      scaled_value_of_first_fixed_surface: scaled_value_of_first_fixed_surface,
      type_of_second_fixed_surfaced: type_of_second_fixed_surfaced,
      scale_factor_of_second_fixed_surface: scale_factor_of_second_fixed_surface,
      scaled_value_of_second_fixed_surfaces: scaled_value_of_second_fixed_surfaces,
      year: year,
      month: month,
      day: day,
      hour: hour,
      minute: minute,
      second: second,
      n_number_of_time_ranges_specifications_describing_the_time_intervals_used_to_calculate_the_statistically_processed_field:
        n_number_of_time_ranges_specifications_describing_the_time_intervals_used_to_calculate_the_statistically_processed_field,
      total_number_of_data_values_missing_in_statistical_process:
        total_number_of_data_values_missing_in_statistical_process,
      statistical_process_used_to_calculate_the_processed_field_from_the_field_at_each_time_increment_during_the_time_range:
        statistical_process_used_to_calculate_the_processed_field_from_the_field_at_each_time_increment_during_the_time_range,
      type_of_time_increment_between_successive_fields_used_in_the_statistical_processing:
        type_of_time_increment_between_successive_fields_used_in_the_statistical_processing,
      indicator_of_unit_of_time_for_time_range_over_which_statistical_processing_is_done:
        indicator_of_unit_of_time_for_time_range_over_which_statistical_processing_is_done,
      length_of_the_time_range_over_which_statistical_processing_is_done_in_units_defined_by_the_previous_octet:
        length_of_the_time_range_over_which_statistical_processing_is_done_in_units_defined_by_the_previous_octet,
      indicator_of_unit_of_time_for_the_increment_between_the_successive_fields_used:
        indicator_of_unit_of_time_for_the_increment_between_the_successive_fields_used,
      time_increment_between_successive_fields_in_units_defined_by_the_previous_octet:
        time_increment_between_successive_fields_in_units_defined_by_the_previous_octet,
      as_octets: as_octets
    }

    {:ok, template, rest}
  end
end
