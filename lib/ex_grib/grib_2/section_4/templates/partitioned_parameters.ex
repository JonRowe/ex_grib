defmodule ExGrib.Grib2.Section4.Templates.PartitionedParameters do
  @moduledoc """
  Template 4.53

  Partitioned parameters at a horizontal levelor horizontal layer at a point in time

  Notes:
  (1) A single partition with code value PN from the partition set composed by the NP partitions is
  represented in the template.The code values of the NP partitions are expressed in octets 14 to
  14+2NP-1.The NP partitions are linked by the normalization formula stating the sum of all the NP
  partitions must be equal to a normalization term (N) on each point of the grid.

  (2) Only parameters expressing fractions or percentages can be used in this template. Code tables
  shall state clearly that they are meant to be used in partitioned parameters context.

  (3) The word "fraction" or the word "percentage" has to be explicitly used in the name of the
  parameter to refer to a normalization term N=1 in the case of "fraction" and N=100 in the case
  of percentage.

  WARNING THIS TEMPLATE WAS AUTOGENERATED AND IS LIKELY INCOMPLETE

  https://www.nco.ncep.noaa.gov/pmb/docs/grib2/grib2_doc/grib2_temp4-53.shtml
  """

  defstruct parameter_category: nil,
            parameter_number: nil,
            partition_table_number: nil,
            number_of_partitions: nil,
            partition_set: nil,
            partition_number: nil,
            type_of_generating_process: nil,
            background_generating_process_identifier: nil,
            analysis_or_forecast_generating_process_identifier: nil,
            hours_after_reference_time_of_data_cut_off_after_reference_time: nil,
            minutes_of_observational_data_cut_off_after_reference_time: nil,
            indicator_of_unit_of_time_range: nil,
            forecast_time_in_units_defined_by_previous_octet: nil,
            type_of_first_fixed_surface: nil,
            scale_factor_of_first_fixed_surface: nil,
            scaled_value_of_first_fixed_surface: nil,
            type_of_second_fixed_surfaced: nil,
            scale_factor_of_second_fixed_surface: nil,
            scaled_value_of_second_fixed_surfaces: nil

  @spec get(binary()) :: no_return
  def get(<<
        # Parameter category (see Code table 4.1)
        parameter_category::integer(),
        # Parameter number (see Code table 4.2  and Notes 2 and 3)
        parameter_number::integer(),
        # Partition Table Number (PTN) (see Notes 1 and 3)
        partition_table_number::integer(),
        # Number of Partitions (NP) (see Note 1)
        number_of_partitions::integer(),
        # Partition set (list all partition numbers in the partition) (see Code table 4.PTN and Note 1))
        partition_set::integer-size(1032),
        # Partition number (PN) (see Code table 4.PTN and Note 3))
        partition_number::integer-size(88),
        # Type of generating process (see Code table 4.3)
        type_of_generating_process::integer(),
        # Background generating process identifier (defined by originating centre)
        background_generating_process_identifier::integer(),
        # Analysis or forecast generating process identifier (see Code ON388 Table A)
        analysis_or_forecast_generating_process_identifier::integer(),
        # Hours after reference time of data cut-off after reference time (see Note 1)
        hours_after_reference_time_of_data_cut_off_after_reference_time::integer-size(88),
        minutes_of_observational_data_cut_off_after_reference_time::integer(),
        # Indicator of unit of time range (see Code table 4.4)
        indicator_of_unit_of_time_range::integer(),
        forecast_time_in_units_defined_by_previous_octet::integer-size(248),
        # Type of first fixed surface (see Code table 4.5)
        type_of_first_fixed_surface::integer(),
        scale_factor_of_first_fixed_surface::integer(),
        scaled_value_of_first_fixed_surface::integer-size(248),
        # Type of second fixed surfaced (see Code table 4.5)
        type_of_second_fixed_surfaced::integer(),
        scale_factor_of_second_fixed_surface::integer(),
        scaled_value_of_second_fixed_surfaces::integer-size(248),
        rest::binary()
      >>) do
    template = %__MODULE__{
      parameter_category: parameter_category,
      parameter_number: parameter_number,
      partition_table_number: partition_table_number,
      number_of_partitions: number_of_partitions,
      partition_set: partition_set,
      partition_number: partition_number,
      type_of_generating_process: type_of_generating_process,
      background_generating_process_identifier: background_generating_process_identifier,
      analysis_or_forecast_generating_process_identifier:
        analysis_or_forecast_generating_process_identifier,
      hours_after_reference_time_of_data_cut_off_after_reference_time:
        hours_after_reference_time_of_data_cut_off_after_reference_time,
      minutes_of_observational_data_cut_off_after_reference_time:
        minutes_of_observational_data_cut_off_after_reference_time,
      indicator_of_unit_of_time_range: indicator_of_unit_of_time_range,
      forecast_time_in_units_defined_by_previous_octet:
        forecast_time_in_units_defined_by_previous_octet,
      type_of_first_fixed_surface: type_of_first_fixed_surface,
      scale_factor_of_first_fixed_surface: scale_factor_of_first_fixed_surface,
      scaled_value_of_first_fixed_surface: scaled_value_of_first_fixed_surface,
      type_of_second_fixed_surfaced: type_of_second_fixed_surfaced,
      scale_factor_of_second_fixed_surface: scale_factor_of_second_fixed_surface,
      scaled_value_of_second_fixed_surfaces: scaled_value_of_second_fixed_surfaces
    }

    {:ok, template, rest}
  end
end
