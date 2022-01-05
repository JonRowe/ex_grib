defmodule ExGrib.Grib2.Section4.Templates.AverageAccumulationAtIntervals do
  @moduledoc """
  Template 4.8

  Average accumulation at intervalseme values orother statistically-processed values at a horizontal level orin a horizontal layer in a continuous or non-continuous time interval

  Notes:

  (1) Hours greater than 65534 will be coded as 65534.

  (2) The reference time in section 1 and the forecast time together define
    the beginning of the overall time interval.

  (3) An increment of zero means that the statistical processing the result
    of continuous (or near continuous) process, not the processing of a
    number of discrete samples. Examples of such continuous process are
    the temperatures measured by analogue maximum and minimum thermometers
    or thermographs and the rainfall measured by a rain gauge.

  (4) The reference and forecast times are successively set to their initial
    plus or minus the increment, as defined by the type of time increment
    (one of octets 48,60,72...). For all but the innermost (last) time range,
    the next inner range is then processed using these reference and forecast
    times as the initial reference and forecast time.

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
            n: nil,
            total_number_of_data_values_missing: nil,
            outermost_range_specification: nil,
            next_innermost_range_specification: nil,
            more_range_specifications: []

  defmodule TimeRangeSpecification do
    defstruct statistical_process: nil,
              type_of_time_increment: nil,
              indicator_of_unit_of_time_for_time_range: nil,
              length_of_the_time_range: nil,
              indicator_of_unit_of_time_for_the_increment: nil,
              time_increment: nil
  end

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
        # number of time ranges specifications describing the time intervals used to calculate the statistically-processed field
        n::integer(),
        # total number of data values missing in statistical process
        total_number_of_data_values_missing::integer-size(32),
        #
        # Remaining fields are time range specifications, there is guarenteed to be at least one, this is the
        # outermost (or only) time range over which statistical processing is done, in total this is 12 octets.
        #
        # Statistical process used to calculate the processed field from the field at each time increment during the time range
        # (see Code Table 4.10)
        statistical_process::integer(),
        # Type of time increment between successive fields used in the statistical processing (see Code Table 4.11)
        type_of_time_increment::integer(),
        # Indicator of unit of time for time range over which statistical processing is done (see Code Table 4.4)
        indicator_of_unit_of_time_for_time_range::integer(),
        # length of the time range over which statistical processing is done in units defined by the previous octet
        length_of_the_time_range::integer-size(32),
        # Indicator of unit of time for the increment between the successive fields used (see Code Table 4.4)
        indicator_of_unit_of_time_for_the_increment::integer(),
        # Time increment between successive fields in units defined by the previous octet (see Notes 3 and 4) 
        time_increment::integer-size(32),
        # This may contain 12 * n - 1 octets
        more::binary()
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
      n: n,
      total_number_of_data_values_missing: total_number_of_data_values_missing,
      outermost_range_specification: %TimeRangeSpecification{
        statistical_process: statistical_process,
        type_of_time_increment: type_of_time_increment,
        indicator_of_unit_of_time_for_time_range: indicator_of_unit_of_time_for_time_range,
        length_of_the_time_range: length_of_the_time_range,
        indicator_of_unit_of_time_for_the_increment: indicator_of_unit_of_time_for_the_increment,
        time_increment: time_increment
      }
    }

    {template_with_additional_time_ranges_if_any, rest} =
      set_additional_time_ranges(n, template, more)

    {:ok, template_with_additional_time_ranges_if_any, rest}
  end

  defp parse_time_range(<<
         # Statistical process used to calculate the processed field from the field at each time increment during the time range
         # (see Code Table 4.10)
         statistical_process::integer(),
         # Type of time increment between successive fields used in the statistical processing (see Code Table 4.11)
         type_of_time_increment::integer(),
         # Indicator of unit of time for time range over which statistical processing is done (see Code Table 4.4)
         indicator_of_unit_of_time_for_time_range::integer(),
         # length of the time range over which statistical processing is done in units defined by the previous octet
         length_of_the_time_range::integer-size(32),
         # Indicator of unit of time for the increment between the successive fields used (see Code Table 4.4)
         indicator_of_unit_of_time_for_the_increment::integer(),
         # Time increment between successive fields in units defined by the previous octet (see Notes 3 and 4) 
         time_increment::integer-size(32),
         # Any remaining data
         more::binary()
       >>) do
    range = %TimeRangeSpecification{
      statistical_process: statistical_process,
      type_of_time_increment: type_of_time_increment,
      indicator_of_unit_of_time_for_time_range: indicator_of_unit_of_time_for_time_range,
      length_of_the_time_range: length_of_the_time_range,
      indicator_of_unit_of_time_for_the_increment: indicator_of_unit_of_time_for_the_increment,
      time_increment: time_increment
    }

    {range, more}
  end

  defp parse_time_ranges(n, more) when n > 0 do
    {range, still_more} = parse_time_range(more)
    {ranges, rest} = parse_time_ranges(n - 1, still_more)
    {[range | ranges], rest}
  end

  defp parse_time_ranges(_, more), do: {[], more}

  defp set_additional_time_ranges(n, template, more) when n > 1 do
    # As octets 47 to 58 next innermost step of processing
    {next_innermost_range, still_more} = parse_time_range(more)

    # Additional time range specifications included in accordance with the value of n.
    # Contents as octets 47 to 58 repeated as necessary, but we've already parsed 2.
    {ranges, rest} = parse_time_ranges(n - 2, still_more)

    template = %__MODULE__{
      template
      | next_innermost_range_specification: next_innermost_range,
        more_range_specifications: ranges
    }

    {template, rest}
  end

  defp set_additional_time_ranges(_, template, more), do: {template, more}
end
